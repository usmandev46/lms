import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/class_reports_filters_model.dart';
import '../model/class_reports_model.dart';
import 'package:dio/dio.dart';

class ClassReportsController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  var isLoading = false.obs;
  var isFilterLoading = false.obs;

  var classReportsList = <ClassReportsDatum>[].obs;
  Rx<ClassReportsFilterModel?> classReportsFilterList = Rx(null);

  var classReportsColumnList = <String>[].obs;

  Rx<ClassReportsFilterBatch?> batches = Rx<ClassReportsFilterBatch?>(null);
  Rx<ClassReportsFilterClass?> classes = Rx<ClassReportsFilterClass?>(null);
  Rx<ClassReportsFilterCourse?> courses = Rx<ClassReportsFilterCourse?>(null);
  Rx<ClassReportsFilterStatus?> status = Rx<ClassReportsFilterStatus?>(null);

  Rx<DateTime?> registeredFrom = Rx<DateTime?>(null);
  Rx<DateTime?> registeredTo = Rx<DateTime?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<ClassReportsDatum>> _pageCache = {};
  late final CustomTableDataSource<ClassReportsDatum> tableSource;

  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<ClassReportsDatum>(
      columns: classReportsColumnList,
      jsonMapper: (course) => course.toJson(),
    );
    classReportsFun();
    courseEnrollmentsReportsFiltersFun();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Class Reports screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }


  void resetFilters() {
    _reportsToken?.cancel();

    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    classReportsColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    batches.value = null;
    classes.value = null;
    courses.value = null;
    status.value = null;

    registeredFrom.value = null;
    registeredTo.value = null;
    Future.microtask(() => classReportsFun(goToPage: 1));
  }

  void clearCache() {
    _pageCache.clear();
  }

  void classReportsFun({int? goToPage}) async {
    if (isLoading.value) return;

    final previousPage = page.value;
    if (goToPage != null) {
      page.value = goToPage;
    }

    if (_pageCache.containsKey(page.value)) {
      final cachedStudents = _pageCache[page.value]!;

      tableSource.setPageItems(
        items: cachedStudents,
        columnKeyMap: _columnKeyMap,
        currentPage: page.value,
        pageSize: limit.value,
      );
      return;
    }

    _reportsToken?.cancel();
    _reportsToken = CancelToken();
    isLoading.value = true;

    try {
      var res = await _api.post(_endpoints.classReports, data: _getFilterMap(),cancelToken: _reportsToken);

      if (res is Map<String, dynamic> && res['success'] == true && res["data"] != null) {

        ClassReportsModel model = ClassReportsModel.fromJson(res);
        totalPage.value = model.totalPages ;
        final courses = model.data;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (classReportsColumnList.isEmpty && courses.isNotEmpty) {
          _generateColumns(courses.first);
        }

        _pageCache[page.value] = courses;

        tableSource.setPageItems(
          items: courses,
          columnKeyMap: _columnKeyMap,
          currentPage: page.value,
          pageSize: limit.value,
        );

      } else {
        page.value = previousPage;
      }

    } catch (e, st) {
      page.value = previousPage;
      if (e is DioException && CancelToken.isCancel(e)) return;
      _handleError("Course Reports", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _getFilterMap() {
    final Map<String, dynamic> data = {
      'page': page.value.toString(),
      'limit': limit.value.toString(),
    };
    if (batches.value != null) data['batch'] = batches.value!.registrationNo;
    if (classes.value != null) data['class'] = classes.value!.id;
    if (courses.value != null) data['course'] = courses.value!.id;
    if (status.value != null) data['status'] = status.value!.value;

    if (registeredFrom.value != null) data['dateFrom'] = registeredFrom.value;
    if (registeredTo.value != null) data['dateTo'] = registeredTo.value;
    return data;
  }

  void courseEnrollmentsReportsFiltersFun() async {
    if (isFilterLoading.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFilterLoading.value = true;

    try {
      var res = await _api.get(_endpoints.classReportsFilters, cancelToken: _filtersToken);

      if (res is Map<String, dynamic> && res['success'] == true && res['data'] != null) {
        classReportsFilterList.value = ClassReportsFilterModel.fromJson(res);
      } else {
        classReportsFilterList.value = null;
        if(res?['message'] != null) {
          Get.snackbar(
            "Error",
            res?['message'] ?? "Failed to fetch class filters",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.error,
            colorText: AppColors.textLight
        );
        }
      }
    } catch (e, st) {
      if (e is DioException && CancelToken.isCancel(e)) {
        debugPrint("Filters API cancelled");
        return;
      }
      _handleError("Class Report Filters", e, st);
    } finally {
      isFilterLoading.value = false;
    }
  }

  void _generateColumns(ClassReportsDatum course) {
    final json = course.toJson();

    classReportsColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < classReportsColumnList.length; i++) {
      _columnKeyMap[classReportsColumnList[i]] = json.keys.elementAt(i);
    }
  }


  void _handleError(String tag, Object e, StackTrace st) {
    FirebaseCrashlytics.instance.recordError(e, st, reason: tag, fatal: false);
    Get.snackbar(
      "Error",
      "Something went wrong",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: AppColors.textLight,
    );
  }

}
