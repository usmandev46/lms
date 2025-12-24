import 'dart:convert';

ClassReportsModel classReportsModelFromJson(String str) => ClassReportsModel.fromJson(json.decode(str));

String classReportsModelToJson(ClassReportsModel data) => json.encode(data.toJson());

class ClassReportsModel {
  bool success;
  String message;
  List<ClassReportsDatum> data;
  int page;
  int limit;
  int totalPages;

  ClassReportsModel({
    required this.success,
    required this.message,
    required this.data,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory ClassReportsModel.fromJson(Map<String, dynamic> json) => ClassReportsModel(
    success: json["success"],
    message: json["message"],
    data: List<ClassReportsDatum>.from(json["data"].map((x) => ClassReportsDatum.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class ClassReportsDatum {
  String id;
  String registrationNo;
  String batch;
  String name;
  String instructor;
  dynamic assistantInstructor;
  dynamic labEngineer;
  dynamic course;
  String status;
  String classCapacity;
  dynamic classRoom;
  DateTime addedOn;
  String addedBy;
  String? updatedOn;
  String? updatedBy;
  String instructorName;
  dynamic assistantInstructorName;
  dynamic labEngineerName;
  dynamic courseName;
  String batchName;

  ClassReportsDatum({
    required this.id,
    required this.registrationNo,
    required this.batch,
    required this.name,
    required this.instructor,
    required this.assistantInstructor,
    required this.labEngineer,
    required this.course,
    required this.status,
    required this.classCapacity,
    required this.classRoom,
    required this.addedOn,
    required this.addedBy,
    this.updatedOn,
    this.updatedBy,
    required this.instructorName,
    required this.assistantInstructorName,
    required this.labEngineerName,
    required this.courseName,
    required this.batchName,
  });

  factory ClassReportsDatum.fromJson(Map<String, dynamic> json) => ClassReportsDatum(
    id: json["id"],
    registrationNo: json["registration_no"],
    batch: json["batch"],
    name: json["name"],
    instructor: json["instructor"],
    assistantInstructor: json["assistant_instructor"],
    labEngineer: json["lab_engineer"],
    course: json["course"],
    status: json["status"],
    classCapacity: json["class_capacity"],
    classRoom: json["class_room"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    instructorName: json["instructor_name"],
    assistantInstructorName: json["assistant_instructor_name"],
    labEngineerName: json["lab_engineer_name"],
    courseName: json["course_name"],
    batchName: json["batch_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "batch": batch,
    "name": name,
    "instructor": instructor,
    "assistant_instructor": assistantInstructor,
    "lab_engineer": labEngineer,
    "course": course,
    "status": status,
    "class_capacity": classCapacity,
    "class_room": classRoom,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
    "instructor_name": instructorName,
    "assistant_instructor_name": assistantInstructorName,
    "lab_engineer_name": labEngineerName,
    "course_name": courseName,
    "batch_name": batchName,
  };
}
