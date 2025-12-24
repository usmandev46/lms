import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../data/repositories/api_service.dart';
import '../model/quiz_reports.dart';
import '../model/quiz_reports_filter.dart';

class QuizController extends GetxController {
  final page = 1.obs;
  final limit = 17.obs;
  final totalPage = 1.obs;

  var isLoading = false.obs;
  var isFilterLoading = false.obs;

  var quizReportsList = <QuizReportDatumss>[].obs;
  Rx<QuizReportFilterModel?> quizFilterList = Rx(null);

  var quizReportsColumnList = <String>[].obs;

  Rx<QuizReportFilterQuiz?> quiz = Rx<QuizReportFilterQuiz?>(null);
  Rx<QuizReportFilterClass?> classes = Rx<QuizReportFilterClass?>(null);
  Rx<QuizReportFilterCourse?> courses = Rx<QuizReportFilterCourse?>(null);
  Rx<QuizReportFilterStudent?> student = Rx<QuizReportFilterStudent?>(null);

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  CancelToken? _reportsToken;
  CancelToken? _filtersToken;

  final Map<String, String> _columnKeyMap = {};
  final Map<int, List<QuizReportDatumss>> _pageCache = {};
  late final CustomTableDataSource<QuizReportDatumss> tableSource;

  @override
  void onInit() {
    super.onInit();
    tableSource = CustomTableDataSource<QuizReportDatumss>(
      columns: quizReportsColumnList,
      jsonMapper: (course) => course.toJson(),
    );
    quizReportsFun();
    quizFiltersFun();
  }

  @override
  void onClose() {
    _reportsToken?.cancel("Quiz screen closed");
    _filtersToken?.cancel("Filters screen closed");
    super.onClose();
  }


  void resetFilters() {
    _reportsToken?.cancel();

    tableSource.clearRows();

    page.value = 1;
    totalPage.value = 1;

    quizReportsColumnList.clear();
    _columnKeyMap.clear();
    _pageCache.clear();

    quiz.value = null;
    classes.value = null;
    courses.value = null;
    student.value = null;

    Future.microtask(() => quizReportsFun(goToPage: 1));
  }

  void clearCache() {
    _pageCache.clear();
  }

  void quizReportsFun({int? goToPage}) async {
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

    isLoading.value = true;

    try {
      var res = await _api.post(_endpoints.quizReports, data: _getFilterMap(),cancelToken: _reportsToken);

      if (res is Map<String, dynamic> && res['success'] == true && res["data"] != null) {
        QuizReportModels model = QuizReportModels.fromJson(res);
        totalPage.value = model.totalPages;

        final courses = model.data;

        if (page.value == 1) {
          tableSource.clear();
        }

        if (quizReportsColumnList.isEmpty && courses.isNotEmpty) {
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
      _handleError("Quiz Reports", e, st);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _getFilterMap() {
    final Map<String, dynamic> data = {
      'page': page.value.toString(),
      'limit': limit.value.toString(),
    };

    if (quiz.value != null) data['quiz'] = quiz.value!.registrationNo;
    if (classes.value != null) data['class'] = classes.value!.registrationNo;
    if (courses.value != null) data['course'] = courses.value!.registrationNo;
    if (student.value != null) data['student'] = student.value!.registrationNo;

    return data;
  }

  void quizFiltersFun() async {
    if (isFilterLoading.value) return;

    _filtersToken?.cancel();
    _filtersToken = CancelToken();

    isFilterLoading.value = true;

    try {
      var res = await _api.get(_endpoints.quizFilters, cancelToken: _filtersToken);

      if (res is Map<String, dynamic> && res['success'] == true && res['filters'] != null) {
        quizFilterList.value = QuizReportFilterModel.fromJson(res);
      } else {
        quizFilterList.value = null;
        if(res?['message'] != null) {
          Get.snackbar(
          "Error",
          res?['message'] ?? "Failed to fetch quiz filters",
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
      _handleError("Quiz Reports Filters", e, st);
    } finally {
      isFilterLoading.value = false;
    }
  }

  void _generateColumns(QuizReportDatumss course) {
    final json = course.toJson();

    quizReportsColumnList.assignAll(
        json.keys.map((k) =>
            k.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '))
    );

    for (int i = 0; i < quizReportsColumnList.length; i++) {
      _columnKeyMap[quizReportsColumnList[i]] = json.keys.elementAt(i);
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
