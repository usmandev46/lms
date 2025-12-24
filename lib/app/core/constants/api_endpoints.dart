import '../helpers/romote_config_baseUrl_sevices.dart';

class ApiEndpoints {

  ApiEndpoints._internal();

  static final ApiEndpoints _instance = ApiEndpoints._internal();

  factory ApiEndpoints() => _instance;

  String get baseUrl => RemoteConfigService.baseUrl;

  String get login => "$baseUrl/login";
  String get regenerateToken => "$baseUrl/regenerate_token";

  String get dashboard => "$baseUrl/dashboard";

  String get studentReports => "$baseUrl/student_reports";
  String get studentFilters => "$baseUrl/student_filters";

  String get studentTracking => "$baseUrl/student_tracking";
  String get studentTrackingFilters => "$baseUrl/student_tracking_filter";

  String get courseReports => "$baseUrl/course_reports";
  String get courseFilters => "$baseUrl/course_filters";

  String get courseEnrollmentsReports => "$baseUrl/course_enrollment_reports";
  String get courseEnrollmentsFilters => "$baseUrl/course_enrollment_filters";

  String get classReports => "$baseUrl/class_reports";
  String get classReportsFilters => "$baseUrl/class_reports_filters";

  String get entryTestEnrollmentsReports => "$baseUrl/entry_test_enrollment_reports";
  String get entryTestEnrollmentFilters => "$baseUrl/entry_test_enrollment_filters";

  String get attendanceReports => "$baseUrl/attendance_reports";
  String get attendanceFilters => "$baseUrl/attendance_reports_filters";

  String get quizReports => "$baseUrl/quiz_report";
  String get quizFilters => "$baseUrl/quiz_reports_filter";

  String get examReports => "$baseUrl/exam_reports";
  String get examFilters => "$baseUrl/exam_reports_filter";
}
