import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/exam_filter_model.dart';
import '../model/exam_reports_model.dart';

class ExamReportsController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  var isLoading = false.obs;
  var isFilterLoading = false.obs;

  var examReportsList = <ExamReportDatum>[].obs;
  Rx<ExamFilterModel?> examFilterList = Rx(null);

  var examReportsColumnList = <String>[].obs;

  Rx<ExamFilterStudent?> student = Rx<ExamFilterStudent?>(null);
  Rx<ExamFilterExam?> exam = Rx<ExamFilterExam?>(null);
  Rx<ExamFilterClass?> classes = Rx<ExamFilterClass?>(null);
  Rx<ExamFilterCourse?> courses = Rx<ExamFilterCourse?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<ExamReportDatum>> _pageCache = {};
  late final CustomTableDataSource<ExamReportDatum> tableSource;

  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<ExamReportDatum>(
      columns: examReportsColumnList,
      jsonMapper: (course) => course.toJson(),
    );
    examReportsFun();
    examFiltersFun();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Exam Reports screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }

  void resetFilters() {
    _reportsToken?.cancel();

    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    examReportsColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    student.value = null;
    exam.value = null;
    classes.value = null;
    courses.value = null;

    Future.microtask(() => examReportsFun(goToPage: 1));
  }

  void clearCache() {
    _pageCache.clear();
  }

  void examReportsFun({int? goToPage}) async {
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
      var res = await _api.post(_endpoints.examReports,  data: _getFilterMap(),cancelToken: _reportsToken);

      if (res is Map<String, dynamic> && res['success'] == true && res["data"] != null) {
        ExamReportModel model = ExamReportModel.fromJson(res);

        totalPage.value = model.totalPages ;
        final examData = model.data;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (examReportsColumnList.isEmpty && examData.isNotEmpty) {
          _generateColumns(examData.first);
        }

        _pageCache[page.value] = examData;

        tableSource.setPageItems(
          items: examData,
          columnKeyMap: _columnKeyMap,
          currentPage: page.value,
          pageSize: limit.value,
        );

      } else {
        page.value = previousPage;
        // if(res?['message'] != null) {
        //   Get.snackbar(
        //   "Error",
        //   res?["message"] ?? "Something went wrong",
        //   backgroundColor: AppColors.error,
        //   colorText: AppColors.textLight,
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        // }
      }
    } catch (e, st) {
      page.value = previousPage;
      if (e is DioException && CancelToken.isCancel(e)) return;
      _handleError("Exam Reports", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _getFilterMap() {
    final Map<String, dynamic> data = {
      'page': page.value.toString(),
      'limit': limit.value.toString(),
    };

    if (student.value != null) data['student'] = student.value!.registrationNo;
    if (exam.value != null) data['exam'] = exam.value!.registrationNo;
    if (classes.value != null) data['class'] = classes.value!.registrationNo;
    if (courses.value != null) data['course'] = courses.value!.registrationNo;

    return data;
  }

  void examFiltersFun() async {
    if (isFilterLoading.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFilterLoading.value = true;

    try {
      var res = await _api.get(_endpoints.examFilters, cancelToken: _filtersToken);

      if (res is Map<String, dynamic> && res['success'] == true && res['filters'] != null) {
        examFilterList.value = ExamFilterModel.fromJson(res);
      } else {
        examFilterList.value = null;
        if(res?['message'] != null) {
          Get.snackbar(
          "Error",
          res?['message'] ?? "Failed to fetch exam filters",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.textLight,
        );
        }
      }
    } catch (e, st) {
      if (e is DioException && CancelToken.isCancel(e)) {
        debugPrint("Filters API cancelled");
        return;
      }
      _handleError("Exam Reports Filters", e, st);
    } finally {
      isFilterLoading.value = false;
    }
  }

  void _generateColumns(ExamReportDatum course) {
    final json = course.toJson();

    examReportsColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < examReportsColumnList.length; i++) {
      _columnKeyMap[examReportsColumnList[i]] = json.keys.elementAt(i);
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
