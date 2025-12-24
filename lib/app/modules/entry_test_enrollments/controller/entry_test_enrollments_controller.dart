import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/entry_test_enrollments_filters_model.dart';
import '../model/entry_test_enrollments_model.dart';
import 'package:dio/dio.dart';


class EntryTestEnrollmentsController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  var isLoading = false.obs;
  var isFilterLoading = false.obs;

  var entryTestEnrollmentsReportsList = <EntryTestEnrollmentsDatum>[].obs;
  Rx<EntryTestEnrollmentsFiltersModel?> entryTestEnrollmentsFilterList = Rx(null);

  var entryTestEnrollmentsColumnList = <String>[].obs;

  Rx<EntryTestEnrollmentsFilterBatch?> batch = Rx<EntryTestEnrollmentsFilterBatch?>(null);
  Rx<EntryTestEnrollmentsFilterEntryTest?> entryTests = Rx<EntryTestEnrollmentsFilterEntryTest?>(null);
  Rx<EntryTestEnrollmentsFilterCourse?> course = Rx<EntryTestEnrollmentsFilterCourse?>(null);
  Rx<EntryTestEnrollmentsFilterStatusList?> status = Rx<EntryTestEnrollmentsFilterStatusList?>(null);

  Rx<DateTime?> registeredFrom = Rx<DateTime?>(null);
  Rx<DateTime?> registeredTo = Rx<DateTime?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<EntryTestEnrollmentsDatum>> _pageCache = {};
  late final CustomTableDataSource<EntryTestEnrollmentsDatum> tableSource;

  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<EntryTestEnrollmentsDatum>(
      columns: entryTestEnrollmentsColumnList,
      jsonMapper: (course) => course.toJson(),
    );
    entryTestEnrollmentsFun();
    entryTestEnrollmentsFiltersFun();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Enrollments test screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }

  void resetFilters() {
    _reportsToken?.cancel();

    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    entryTestEnrollmentsColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    batch.value = null;
    entryTests.value = null;
    course.value = null;
    status.value = null;
    registeredFrom.value = null;
    registeredTo.value = null;

    Future.microtask(() => entryTestEnrollmentsFun(goToPage: 1));
  }

  void clearCache() {
    _pageCache.clear();
  }

  void entryTestEnrollmentsFun({int? goToPage}) async {
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
      var res = await _api.post(_endpoints.entryTestEnrollmentsReports, data: _getFilterMap(),cancelToken: _reportsToken);

      if (res is Map<String, dynamic> && res['success'] == true && res["data"] != null) {

        EntryTestEnrollmentsModel model = EntryTestEnrollmentsModel.fromJson(res);

        totalPage.value = model.totalPages ;
        final courses = model.data;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (entryTestEnrollmentsColumnList.isEmpty && courses.isNotEmpty) {
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
      _handleError("Entry Test Enrollments", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _getFilterMap() {
    final Map<String, dynamic> data = {
      'page': page.value.toString(),
      'limit': limit.value.toString(),
    };

    if (batch.value != null) data['batch'] = batch.value!.registrationNo;
    if (entryTests.value != null) data['test'] = entryTests.value!.registrationNo;
    if (course.value != null) data['course'] = course.value!.id;
    if (status.value != null) data['status'] = status.value!.id;

    if (registeredFrom.value != null) data['dateFrom'] = registeredFrom.value!.toIso8601String().split("T")[0];
    if (registeredTo.value != null) data['dateTo'] = registeredTo.value!.toIso8601String().split("T")[0];
    return data;
  }

  void entryTestEnrollmentsFiltersFun() async {
    if (isFilterLoading.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFilterLoading.value = true;

    try {
      var res = await _api.get(_endpoints.entryTestEnrollmentFilters, cancelToken: _filtersToken);

      if (res is Map<String, dynamic> && res['success'] == true && res['filters'] != null) {
        entryTestEnrollmentsFilterList.value = EntryTestEnrollmentsFiltersModel.fromJson(res);
      } else {
        entryTestEnrollmentsFilterList.value = null;
        if(res?['message'] != null) {
          Get.snackbar(
            "Error",
            res?['message'] ?? "Failed to fetch Entry Test Enrollments filters",
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
      _handleError("Course Enrollments Filters", e, st);
    } finally {
      isFilterLoading.value = false;
    }
  }

  void _generateColumns(EntryTestEnrollmentsDatum course) {
    final json = course.toJson();

    entryTestEnrollmentsColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < entryTestEnrollmentsColumnList.length; i++) {
      _columnKeyMap[entryTestEnrollmentsColumnList[i]] = json.keys.elementAt(i);
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
