import 'dart:convert';

QuizReportModels quizReportModelFromJson(String str) => QuizReportModels.fromJson(json.decode(str));

String quizReportModelsToJson(QuizReportModels data) => json.encode(data.toJson());

class QuizReportModels {
  bool success;
  List<QuizReportDatumss> data;
  int page;
  int limit;
  int totalPages;

  QuizReportModels({
    required this.success,
    required this.data,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory QuizReportModels.fromJson(Map<String, dynamic> json) => QuizReportModels(
    success: json["success"],
    data: List<QuizReportDatumss>.from(json["data"].map((x) => QuizReportDatumss.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class QuizReportDatumss {
  String id;
  String quizRegistrationNo;
  String studentRegistrationNo;
  String submissionStatus;
  DateTime startTime;
  dynamic remarks;
  String? achievedMarks;
  String? totalMarks;
  String? percentage;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String quizTitle;
  String studentName;
  String studentEmail;
  DateTime studentDob;
  String studentCnic;
  String studentMobile;
  String studentFatherName;
  String studentRegistration;
  String studentAddress;
  String studentGender;

  QuizReportDatumss({
    required this.id,
    required this.quizRegistrationNo,
    required this.studentRegistrationNo,
    required this.submissionStatus,
    required this.startTime,
    required this.remarks,
    this.achievedMarks,
     this.totalMarks,
     this.percentage,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    required this.quizTitle,
    required this.studentName,
    required this.studentEmail,
    required this.studentDob,
    required this.studentCnic,
    required this.studentMobile,
    required this.studentFatherName,
    required this.studentRegistration,
    required this.studentAddress,
    required this.studentGender,
  });

  factory QuizReportDatumss.fromJson(Map<String, dynamic> json) => QuizReportDatumss(
    id: json["id"],
    quizRegistrationNo: json["quiz_registration_no"],
    studentRegistrationNo: json["student_registration_no"],
    submissionStatus: json["submission_status"],
    startTime: DateTime.parse(json["start_time"]),
    remarks: json["remarks"],
    achievedMarks: json["achieved_marks"] ??'',
    totalMarks: json["total_marks"] ?? '',
    percentage: json["percentage"] ?? '',
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    quizTitle: json["quiz_title"],
    studentName: json["student_name"],
    studentEmail: json["student_email"],
    studentDob: DateTime.parse(json["student_dob"]),
    studentCnic: json["student_cnic"],
    studentMobile: json["student_mobile"],
    studentFatherName: json["student_father_name"],
    studentRegistration: json["student_registration"],
    studentAddress: json["student_address"],
    studentGender: json["student_gender"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "student_name": studentName,
    "student_email": studentEmail,
    "student_dob": "${studentDob.year.toString().padLeft(4, '0')}-${studentDob.month.toString().padLeft(2, '0')}-${studentDob.day.toString().padLeft(2, '0')}",
    "student_cnic": studentCnic,
    "quiz_title": quizTitle,
    "student_mobile": studentMobile,
    "student_father_name": studentFatherName,
    "student_registration": studentRegistration,
    "student_address": studentAddress,
    "student_gender": studentGender,
    "quiz_registration_no": quizRegistrationNo,
    "student_registration_no": studentRegistrationNo,
    "submission_status": submissionStatus,
    "start_time": startTime.toIso8601String(),
    // "remarks": remarks,
    "achieved_marks": achievedMarks,
    "total_marks": totalMarks,
    "percentage": percentage,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}
