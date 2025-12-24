
import 'dart:convert';

AttendanceReportModel attendanceReportModelFromJson(String str) => AttendanceReportModel.fromJson(json.decode(str));

String attendanceReportModelToJson(AttendanceReportModel data) => json.encode(data.toJson());

class AttendanceReportModel {
  bool success;
  String message;
  AttendanceReportData data;

  AttendanceReportModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AttendanceReportModel.fromJson(Map<String, dynamic> json) => AttendanceReportModel(
    success: json["success"],
    message: json["message"],
    data: AttendanceReportData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class AttendanceReportData {
  String selectedCourse;
  String selectedBatch;
  String selectedClass;
  String selectedPercentage;
  List<AttendanceSheet> attendanceSheets;
  int page;
  int limit;
  int totalPages;

  AttendanceReportData({
    required this.selectedCourse,
    required this.selectedBatch,
    required this.selectedClass,
    required this.selectedPercentage,
    required this.attendanceSheets,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory AttendanceReportData.fromJson(Map<String, dynamic> json) => AttendanceReportData(
    selectedCourse: json["selectedCourse"],
    selectedBatch: json["selectedBatch"],
    selectedClass: json["selectedClass"],
    selectedPercentage: json["selectedPercentage"],
    attendanceSheets: List<AttendanceSheet>.from(json["attendanceSheets"].map((x) => AttendanceSheet.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "selectedCourse": selectedCourse,
    "selectedBatch": selectedBatch,
    "selectedClass": selectedClass,
    "selectedPercentage": selectedPercentage,
    "attendanceSheets": List<dynamic>.from(attendanceSheets.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class AttendanceSheet {
  String id;
  String registrationNo;
  String sheetTitle;
  String status;
  String sheetLock;
  String batch;
  String attendanceSheetClass;
  String course;
  String totalDays;
  dynamic presentPercentage;
  dynamic absentPercentage;
  dynamic leavePercentage;
  String totalPresents;
  String totalAbsents;
  String totalLeaves;
  DateTime? addedOn;
  String addedBy;
  DateTime? updatedOn;
  dynamic updatedBy;
  dynamic courseName;
  String batchTitle;
  String className;

  AttendanceSheet({
    required this.id,
    required this.registrationNo,
    required this.sheetTitle,
    required this.status,
    required this.sheetLock,
    required this.batch,
    required this.attendanceSheetClass,
    required this.course,
    required this.totalDays,
    required this.presentPercentage,
    required this.absentPercentage,
    required this.leavePercentage,
    required this.totalPresents,
    required this.totalAbsents,
    required this.totalLeaves,
    this.addedOn,
    required this.addedBy,
    this.updatedOn,
    required this.updatedBy,
    required this.courseName,
    required this.batchTitle,
    required this.className,
  });

  factory AttendanceSheet.fromJson(Map<String, dynamic> json) => AttendanceSheet(
    id: json["id"] ?? '',
    registrationNo: json["registration_no"] ?? '',
    sheetTitle: json["sheet_title"] ?? '',
    status: json["status"] ?? '',
    sheetLock: json["sheet_lock"] ?? '',
    batch: json["batch"] ?? '',
    attendanceSheetClass: json["class"] ?? '',
    course: json["course"] ?? '',
    totalDays: json["total_days"] ?? '',
    presentPercentage: json["present_percentage"] ?? '',
    absentPercentage: json["absent_percentage"] ?? '',
    leavePercentage: json["leave_percentage"] ?? '',
    totalPresents: json["total_presents"] ?? '',
    totalAbsents: json["total_absents"] ?? '',
    totalLeaves: json["total_leaves"] ?? '',
    addedOn: json["added_on"] != null ? DateTime.parse(json["added_on"]) : null,
    addedBy: json["added_by"] ?? '',
    updatedOn: json["updated_on"] != null ? DateTime.parse(json["updated_on"]) : null,
    updatedBy: json["updated_by"] ?? '',
    courseName: json["course_name"] ?? '',
    batchTitle: json["batch_title"] ?? '',
    className: json["class_name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "registration_no": registrationNo,
    "sheet_title": sheetTitle,
    "status": status,
    "sheet_lock": sheetLock,
    // "batch": batch,
    "course_name": courseName,
    "batch_title": batchTitle,
    "class_name": className,
    // "class": attendanceSheetClass,
    // "course": course,
    "total_days": totalDays,
    "present_percentage": presentPercentage,
    "absent_percentage": absentPercentage,
    "leave_percentage": leavePercentage,
    "total_presents": totalPresents,
    "total_absents": totalAbsents,
    "total_leaves": totalLeaves,
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
  };
}
