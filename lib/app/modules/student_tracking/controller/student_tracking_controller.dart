import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/studentTrackingFilterMode.dart';
import '../model/studentTrackingModel.dart';


class StudentTrackingController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  var isLoading = false.obs;
  var isFilterLoading = false.obs;

  var studentTrackingList = <StudentTrackingDatum>[].obs;
  Rx<StudentTrackingFilterModel?> studentTrackingFilterList = Rx(null);

  var studentTrackingColumnList = <String>[].obs;

  Rx<TrackingStatus?> trackingStatus = Rx<TrackingStatus?>(null);
  Rx<TrackingCourse?> trackingCourse = Rx<TrackingCourse?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<StudentTrackingDatum>> _pageCache = {};
  late final CustomTableDataSource<StudentTrackingDatum> tableSource;

  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<StudentTrackingDatum>(
      columns: studentTrackingColumnList,
      jsonMapper: (student) => student.toJson(),
    );
    studentTrackingFun();
    studentTrackingFiltersFun();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Tracking screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }

  void resetFilters() {
    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    studentTrackingColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    trackingStatus.value = null;
    trackingCourse.value = null;

    studentTrackingFun(goToPage: 1);
  }

  void clearCache() {
    _pageCache.clear();
  }

  void studentTrackingFun({int? goToPage}) async {
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
      var res = await _api.post(_endpoints.studentTracking, data: _getFilterMap(),cancelToken: _reportsToken);

      if (res is Map<String, dynamic> && res['success'] == true && res["data"] != null) {

        StudentTrackingModel model = StudentTrackingModel.fromJson(res);
        totalPage.value = model.totalPages;
        final students = model.data;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (studentTrackingColumnList.isEmpty && students.isNotEmpty) {
          _generateColumns(students.first);
        }

        _pageCache[page.value] = students;

        tableSource.setPageItems(
          items: students,
          columnKeyMap: _columnKeyMap,
          currentPage: page.value,
          pageSize: limit.value,
        );
      }else{
        page.value = previousPage;
      }
    } catch (e, st) {
      page.value = previousPage;
      if (e is DioException && CancelToken.isCancel(e)) return;
      _handleError("Student Tracking", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _getFilterMap() {
    final Map<String, dynamic> data = {
      'page': page.value.toString(),
      'limit': limit.value.toString(),
    };
    if (trackingStatus.value != null) data['status'] = trackingStatus.value!.value;
    if (trackingCourse.value != null) data['course'] = trackingCourse.value!.registrationNo;
    return data;
  }

  void studentTrackingFiltersFun() async {
    if (isFilterLoading.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFilterLoading.value = true;

    try {
      var res = await _api.get(_endpoints.studentTrackingFilters,cancelToken: _filtersToken);

      if (res is Map<String, dynamic> && res['success'] == true && res['filters'] != null) {
        studentTrackingFilterList.value = StudentTrackingFilterModel.fromJson(res);
      }
    } catch (e, st) {
      if (e is DioException && CancelToken.isCancel(e)) {
        debugPrint("Filters API cancelled");
        return;
      }
      _handleError("Student Tracking Filters", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  void _generateColumns(StudentTrackingDatum student) {
    final json = student.toJson();

    studentTrackingColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < studentTrackingColumnList.length; i++) {
      _columnKeyMap[studentTrackingColumnList[i]] = json.keys.elementAt(i);
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
