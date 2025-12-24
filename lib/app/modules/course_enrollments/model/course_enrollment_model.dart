import 'dart:convert';

CourseEnrollmentsReportsModel courseEnrollmentsReportsModelFromJson(String str) =>
    CourseEnrollmentsReportsModel.fromJson(json.decode(str));

String courseEnrollmentsReportsModelToJson(CourseEnrollmentsReportsModel data) =>
    json.encode(data.toJson());

class CourseEnrollmentsReportsModel {
  bool success;
  CourseEnrollmentsReportsData data;

  CourseEnrollmentsReportsModel({
    required this.success,
    required this.data,
  });

  factory CourseEnrollmentsReportsModel.fromJson(Map<String, dynamic> json) {
    final statusList = (json["statuses"] ?? json["data"]?["statuses"] ?? [])
        .map<CourseEnrollmentStatus>((x) => CourseEnrollmentStatus.fromJson(x))
        .toList();

    final enrollmentList = (json["courseEnrollments"] ?? json["data"]?["courseEnrollments"] ?? [])
        .map<CourseEnrollment>((x) => CourseEnrollment.fromJson(x, statusList))
        .toList();

    return CourseEnrollmentsReportsModel(
      success: json["success"] ?? false,
      data: CourseEnrollmentsReportsData(
        selectedBatch: json["data"]["selectedBatch"] ?? "",
        selectedCourse: json["data"]["selectedCourse"] ?? "",
        selectedClass: json["data"]["selectedClass"] ?? "",
        selectedStatus: json["data"]["selectedStatus"] ?? "",
        selectedFrom: json["data"]["selectedFrom"] ?? "",
        selectedTo: json["data"]["selectedTo"] ?? "",
        statuses: statusList,
        courseEnrollments: enrollmentList,
        page: json["data"]["page"] ?? 1,
        limit: json["data"]["limit"] ?? 20,
        totalPages: json["data"]["total_pages"] ?? 1,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class CourseEnrollmentsReportsData {
  String selectedBatch;
  String selectedCourse;
  String selectedClass;
  String selectedStatus;
  String selectedFrom;
  String selectedTo;
  List<CourseEnrollmentStatus> statuses;
  List<CourseEnrollment> courseEnrollments;
  int page;
  int limit;
  int totalPages;

  CourseEnrollmentsReportsData({
    required this.selectedBatch,
    required this.selectedCourse,
    required this.selectedClass,
    required this.selectedStatus,
    required this.selectedFrom,
    required this.selectedTo,
    required this.statuses,
    required this.courseEnrollments,
    required this.page,
    required this.totalPages,
    required this.limit,
  });

  Map<String, dynamic> toJson() => {
    "selectedBatch": selectedBatch,
    "selectedCourse": selectedCourse,
    "selectedClass": selectedClass,
    "selectedStatus": selectedStatus,
    "selectedFrom": selectedFrom,
    "selectedTo": selectedTo,
    "statuses": List<dynamic>.from(statuses.map((x) => x.toJson())),
    "courseEnrollments":
    List<dynamic>.from(courseEnrollments.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class CourseEnrollment {
  String id;
  String batch;
  String courseEnrollmentClass;
  String student;
  dynamic course;
  String testimony;
  String status;
  dynamic remarks;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String className;
  String studentName;
  String studentEmail;
  String studentDob;
  String studentCnic;
  String studentMobile;
  String studentFatherName;
  String studentRegistration;
  String studentAddress;
  String studentGender;
  String batchTitle;
  dynamic courseName;
  String statusName;

  CourseEnrollment({
    required this.id,
    required this.batch,
    required this.courseEnrollmentClass,
    required this.student,
    required this.course,
    required this.testimony,
    required this.status,
    required this.remarks,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    required this.className,
    required this.studentName,
    required this.studentEmail,
    required this.studentDob,
    required this.studentCnic,
    required this.studentMobile,
    required this.studentFatherName,
    required this.studentRegistration,
    required this.studentAddress,
    required this.studentGender,
    required this.batchTitle,
    required this.courseName,
    required this.statusName,
  });

  factory CourseEnrollment.fromJson(
      Map<String, dynamic> json, List<CourseEnrollmentStatus> statuses) {
    final rawStatus = json["status"]?.toString() ?? "";

    return CourseEnrollment(
      id: json["id"].toString(),
      batch: json["batch"].toString(),
      courseEnrollmentClass: json["class"].toString(),
      student: json["student"].toString(),
      course: json["course"],
      testimony: json["testimony"]?.toString() ?? "",
      status: rawStatus,
      remarks: json["remarks"],
      addedOn: DateTime.tryParse(json["added_on"] ?? "") ?? DateTime.now(),
      addedBy: json["added_by"]?.toString() ?? "",
      updatedOn: json["updated_on"],
      updatedBy: json["updated_by"],
      className: json["class_name"]?.toString() ?? "",
      studentName: json["student_name"]?.toString() ?? "",
      studentEmail: json["student_email"]?.toString() ?? "",
      studentDob: json["student_dob"]?.toString() ?? "",
      studentCnic: json["student_cnic"]?.toString() ?? "",
      studentMobile: json["student_mobile"]?.toString() ?? "",
      studentFatherName: json["student_father_name"]?.toString() ?? "",
      studentRegistration: json["student_registration"]?.toString() ?? "",
      studentAddress: json["student_address"]?.toString() ?? "",
      studentGender: (json["student_gender"] == "1" ? "Male" : "Female"),
      batchTitle: json["batch_title"]?.toString() ?? "",
      courseName: json["course_name"],
      statusName: _getStatusLabel(rawStatus, statuses),
    );
  }

  Map<String, dynamic> toJson() => {
    "student_registration": studentRegistration,
    "student_name": studentName,
    "student_father_name": studentFatherName,
    "student_email": studentEmail,
    "student_dob": studentDob,
    "student_cnic": studentCnic,
    "student_mobile": studentMobile,
    "student_gender": studentGender,
    "student_address": studentAddress,
    "batch_title": batchTitle,
    "class_name": className,
    "course_name": courseName,
    "status_name": statusName,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class CourseEnrollmentStatus {
  String value;
  String label;

  CourseEnrollmentStatus({
    required this.value,
    required this.label,
  });

  factory CourseEnrollmentStatus.fromJson(Map<String, dynamic> json) =>
      CourseEnrollmentStatus(
        value: json["value"].toString(),
        label: json["label"].toString(),
      );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

String _getStatusLabel(String value, List<CourseEnrollmentStatus> statuses) {
  try {
    final match =
    statuses.firstWhere((e) => e.value.toString() == value.toString());
    return match.label;
  } catch (e) {
    return "";
  }
}
