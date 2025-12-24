import 'package:get/get.dart';

import '../modules/attendance_reports/binding/attendance_reports_binding.dart';
import '../modules/attendance_reports/view/attendance_reports_view.dart';
import '../modules/bottom_bar/binding/bottom_nav_binding.dart';
import '../modules/bottom_bar/view/student_bottom_bar.dart';
import '../modules/class_reports/binding/class_reports_binding.dart';
import '../modules/class_reports/view/class_reports_view.dart';
import '../modules/course_enrollments/binding/course_enrollments_binding.dart';
import '../modules/course_enrollments/view/course_enrollment_view.dart';
import '../modules/course_reports/binding/course_report_binding.dart';
import '../modules/course_reports/view/course_reports_view.dart';
import '../modules/entry_test_enrollments/binding/entry_test_enrollments_binding.dart';
import '../modules/entry_test_enrollments/view/entry_test_enrollments_view.dart';
import '../modules/exam_reports/binding/exam_reports_binding.dart';
import '../modules/exam_reports/view/exam_reports_view.dart';
import '../modules/home/admin_home_view/binding/admin_home_binding.dart';
import '../modules/home/admin_home_view/view/admin_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/view/login_view.dart';
import '../modules/quiz_reports/binding/quiz_reports_binding.dart';
import '../modules/quiz_reports/view/quiz_reports_view.dart';
import '../modules/role/binding/role_binding.dart';
import '../modules/role/view/role_view.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import '../modules/student_tracking/binding/student_tracking_binding.dart';
import '../modules/student_tracking/view/student_tracking_view.dart';
import '../modules/students_reports_view/binding/student_reports_binding.dart';
import '../modules/students_reports_view/view/students_reports_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [

    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.role,
      page: () => RoleSelectionView(),
      binding: RoleBinding(),
    ),

    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.studentHome,
      page: () => StudentBottomBar(),
      bindings: [
        BottomNavBinding(),
        AdminHomeBinding(),
      ],
    ),

    GetPage(
      name: Routes.adminHome,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),

    GetPage(
      name: Routes.studentReports,
      page: () => StudentsReportsView(),
      binding: StudentReportsBinding(),
    ),

    GetPage(
      name: Routes.studentTracking,
      page: () => StudentTrackingView(),
      binding: StudentTrackingBinding(),
    ),

    GetPage(
      name: Routes.courseReports,
      page: () => CourseReportsView(),
      binding: CourseReportsBinding(),
    ),

    GetPage(
      name: Routes.courseEnrollments,
      page: () => CourseEnrollmentView(),
      binding: CourseEnrollmentsBinding(),
    ),

    GetPage(
      name: Routes.entryTestEnrollments,
      page: () => EntryTestEnrollmentsView(),
      binding: EntryTestEnrollmentsBinding(),
    ),

    GetPage(
      name: Routes.classReports,
      page: () => ClassReportsView(),
      binding: ClassReportsBinding(),
    ),

    GetPage(
      name: Routes.attendanceReports,
      page: () => AttendanceReportsView(),
      binding: AttendanceReportsBinding(),
    ),

    GetPage(
      name: Routes.quizReports,
      page: () => QuizReportsView(),
      binding: QuizReportsBinding(),
    ),

    GetPage(
      name: Routes.examReports,
      page: () => ExamReportsView(),
      binding: ExamReportsBinding(),
    ),

  ];
}
