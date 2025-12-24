import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/student_reports_model.dart';
import '../model/students_filters.dart';

class StudentReportsController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  final isFetchingReports = false.obs;
  final isFetchingFilters = false.obs;

  final studentReportsColumnList = <String>[].obs;
  final studentFilterReportsList = Rxn<StudentFilterModel>();

  final citySelect = Rxn<City>();
  final districtSelect = Rxn<District>();
  final tehsileSelect = Rxn<District>();
  final domicileSelect = Rxn<Centers>();
  final degreeSelect = Rxn<Centers>();
  final concentrationsSelect = Rxn<Centers>();
  final timeSlotSelect = Rxn<Centers>();
  final centerSelect = Rxn<Centers>();
  final salarySlabSelect = Rxn<Centers>();
  final courseOneSelect = Rxn<Course>();
  final courseTwoSelect = Rxn<Course>();
  final genderSelect = Rxn<Gender>();
  final currentlyEnrolledSelect = Rxn<Gender>();
  final employeeStatusSelect = Rxn<Gender>();
  final statusSelect = Rxn<Gender>();
  final registeredFrom = Rx<DateTime?>(null);
  final registeredTo = Rx<DateTime?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<Student>> _pageCache = {};
  late final CustomTableDataSource<Student> tableSource;


  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<Student>(
      columns: studentReportsColumnList,
      jsonMapper: (student) => student.toJson(),
    );
    fetchReports();
    fetchFilters();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Reports screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }

  void resetFilters() {
    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    studentReportsColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    citySelect.value = null;
    districtSelect.value = null;
    tehsileSelect.value = null;
    domicileSelect.value = null;
    degreeSelect.value = null;
    concentrationsSelect.value = null;
    timeSlotSelect.value = null;
    centerSelect.value = null;
    salarySlabSelect.value = null;
    courseOneSelect.value = null;
    courseTwoSelect.value = null;
    genderSelect.value = null;
    currentlyEnrolledSelect.value = null;
    employeeStatusSelect.value = null;
    statusSelect.value = null;
    registeredFrom.value = null;
    registeredTo.value = null;

    fetchReports(goToPage: 1);
  }


  void clearCache() {
    _pageCache.clear();
  }


  Future<void> fetchReports({int? goToPage}) async {
    if (isFetchingReports.value) return;
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
    isFetchingReports.value = true;

    try {
      final res = await _api.post(
        _endpoints.studentReports,
        data: _buildFilterPayload(),
        cancelToken: _reportsToken,
      );

      if (res is Map<String, dynamic> &&
          res['success'] == true &&
          res['data'] != null) {

        final model = StudentReportsModel.fromJson(res);

        totalPage.value = model.totalPages;
        final students = model.data.students;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (studentReportsColumnList.isEmpty && students.isNotEmpty) {
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
      _handleError("Student Reports", e, st);
    } finally {
      isFetchingReports.value = false;
    }
  }

  Future<void> fetchFilters() async {
    if (isFetchingFilters.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFetchingFilters.value = true;

    try {
      final res = await _api.get(
        _endpoints.studentFilters,
        cancelToken: _filtersToken,
      );

      if (res is Map<String, dynamic> && res['success'] == true && res['filters'] != null) {
        studentFilterReportsList.value = StudentFilterModel.fromJson(res);
      }
    } catch (e, st) {
      if (e is DioException && CancelToken.isCancel(e)) {
        debugPrint("Filters API cancelled");
        return;
      }
      _handleError("Student Filters", e, st);
    } finally {
      isFetchingFilters.value = false;
    }
  }

  Map<String, dynamic> _buildFilterPayload() {
    final Map<String, dynamic> data = {
      'page': page.value,
      'limit': limit.value,
    };

    void add(String key, dynamic value) {
      if (value != null) data[key] = value.id;
    }

    add('district', districtSelect.value);
    add('tehsil', tehsileSelect.value);
    add('domicile', domicileSelect.value);
    add('gender', genderSelect.value);
    add('city', citySelect.value);
    add('degree', degreeSelect.value);
    add('academic_concentration', concentrationsSelect.value);
    add('time_slot', timeSlotSelect.value);
    add('center', centerSelect.value);
    add('salary_slab', salarySlabSelect.value);
    add('preffered_course_one', courseOneSelect.value);
    add('preffered_course_two', courseTwoSelect.value);
    add('enrollment_status', statusSelect.value);

    if (registeredFrom.value != null) {
      data['dateFrom'] = registeredFrom.value!.toIso8601String().split('T').first;
    }

    if (registeredTo.value != null) {
      data['dateTo'] = registeredTo.value!.toIso8601String().split('T').first;
    }

    return data;
  }

  void _generateColumns(Student student) {
    final json = student.toJson();

    studentReportsColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < studentReportsColumnList.length; i++) {
      _columnKeyMap[studentReportsColumnList[i]] = json.keys.elementAt(i);
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
