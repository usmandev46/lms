import 'dart:convert';

ExamReportModel examReportModelFromJson(String str) => ExamReportModel.fromJson(json.decode(str));

String examReportModelToJson(ExamReportModel data) => json.encode(data.toJson());

class ExamReportModel {
  bool success;
  List<ExamReportDatum> data;
  int page;
  int limit;
  int totalPages;

  ExamReportModel({
    required this.success,
    required this.data,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory ExamReportModel.fromJson(Map<String, dynamic> json) => ExamReportModel(
    success: json["success"],
    data: List<ExamReportDatum>.from(json["data"].map((x) => ExamReportDatum.fromJson(x))),
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

class ExamReportDatum {
  String id;
  String examRegistrationNo;
  String studentRegistrationNo;
  String submissionStatus;
  DateTime startTime;
  String remarks;
  String achievedMarks;
  String totalMarks;
  String percentage;
  DateTime? addedOn;
  String addedBy;
  DateTime? updatedOn;
  String updatedBy;
  String examTitle;
  String studentName;
  String studentEmail;
  DateTime? studentDob;
  String studentCnic;
  String studentMobile;
  String fatherName;
  String studentRegistration;
  String studentAddress;
  String studentGender;

  ExamReportDatum({
    required this.id,
    required this.examRegistrationNo,
    required this.studentRegistrationNo,
    required this.submissionStatus,
    required this.startTime,
    required this.remarks,
    required this.achievedMarks,
    required this.totalMarks,
    required this.percentage,
     this.addedOn,
    required this.addedBy,
     this.updatedOn,
    required this.updatedBy,
    required this.examTitle,
    required this.studentName,
    required this.studentEmail,
    this.studentDob,
    required this.studentCnic,
    required this.studentMobile,
    required this.fatherName,
    required this.studentRegistration,
    required this.studentAddress,
    required this.studentGender,
  });

  factory ExamReportDatum.fromJson(Map<String, dynamic> json) => ExamReportDatum(
    id: json["id"],
    examRegistrationNo: json["exam_registration_no"],
    studentRegistrationNo: json["student_registration_no"],
    submissionStatus: json["submission_status"],
    startTime: DateTime.parse(json["start_time"]),
    remarks: json["remarks"] ?? '',
    achievedMarks: json["achieved_marks"] ?? '',
    totalMarks: json["total_marks"] ?? '',
    percentage: json["percentage"] ?? '',
    addedOn: json["added_on"] != null ? DateTime.parse(json["added_on"]) : null,
    addedBy: json["added_by"] ?? "",
    updatedOn: json["updated_on"] != null ? DateTime.parse(json["updated_on"]) : null,
    updatedBy: json["updated_by"] ?? '',
    examTitle: json["exam_title"] ?? "",
    studentName: json["student_name"] ?? '',
    studentEmail: json["student_email"] ?? '',
    studentDob: json["student_dob"] != null ? DateTime.parse(json["student_dob"]) : null,
    studentCnic: json["student_cnic"] ?? '',
    studentMobile: json["student_mobile"] ??'',
    fatherName: json["father_name"] ?? '',
    studentRegistration: json["student_registration"] ?? '',
    studentAddress: json["student_address"] ?? '',
    studentGender: json["student_gender"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exam_registration_no": examRegistrationNo,
    "student_registration_no": studentRegistrationNo,
    "submission_status": submissionStatus,
    "start_time": startTime.toIso8601String(),
    "remarks": remarks,
    "achieved_marks": achievedMarks,
    "total_marks": totalMarks,
    "percentage": percentage,
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
    "exam_title": examTitle,
    "student_name": studentName,
    "student_email": studentEmail,
    "student_dob": "${studentDob?.year.toString().padLeft(4, '0')}-${studentDob?.month.toString().padLeft(2, '0')}-${studentDob?.day.toString().padLeft(2, '0')}",
    "student_cnic": studentCnic,
    "student_mobile": studentMobile,
    "father_name": fatherName,
    "student_registration": studentRegistration,
    "student_address": studentAddress,
    "student_gender": studentGender,
  };
}
