import 'dart:convert';

AttendanceReportFilterModel attendanceReportFilterModelFromJson(String str) => AttendanceReportFilterModel.fromJson(json.decode(str));

String attendanceReportFilterModelToJson(AttendanceReportFilterModel data) => json.encode(data.toJson());

class AttendanceReportFilterModel {
  bool success;
  String message;
  AttendanceFilterData data;

  AttendanceReportFilterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AttendanceReportFilterModel.fromJson(Map<String, dynamic> json) => AttendanceReportFilterModel(
    success: json["success"],
    message: json["message"],
    data: AttendanceFilterData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class AttendanceFilterData {
  List<AttendanceFilterCourse> courses;
  List<AttendanceFilterBatch> batches;
  List<AttendanceFilterClass> classes;

  AttendanceFilterData({
    required this.courses,
    required this.batches,
    required this.classes,
  });

  factory AttendanceFilterData.fromJson(Map<String, dynamic> json) => AttendanceFilterData(
    courses: List<AttendanceFilterCourse>.from(json["courses"].map((x) => AttendanceFilterCourse.fromJson(x))),
    batches: List<AttendanceFilterBatch>.from(json["batches"].map((x) => AttendanceFilterBatch.fromJson(x))),
    classes: List<AttendanceFilterClass>.from(json["classes"].map((x) => AttendanceFilterClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "batches": List<dynamic>.from(batches.map((x) => x.toJson())),
    "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
  };
}

class AttendanceFilterBatch {
  String id;
  String registrationNo;
  String title;
  DateTime batchStart;
  DateTime batchEnd;
  String status;
  DateTime addedOn;
  String addedBy;
  DateTime? updatedOn;
  String? updatedBy;

  AttendanceFilterBatch({
    required this.id,
    required this.registrationNo,
    required this.title,
    required this.batchStart,
    required this.batchEnd,
    required this.status,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory AttendanceFilterBatch.fromJson(Map<String, dynamic> json) => AttendanceFilterBatch(
    id: json["id"],
    registrationNo: json["registration_no"],
    title: json["title"],
    batchStart: DateTime.parse(json["batch_start"]),
    batchEnd: DateTime.parse(json["batch_end"]),
    status: json["status"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "title": title,
    "batch_start": "${batchStart.year.toString().padLeft(4, '0')}-${batchStart.month.toString().padLeft(2, '0')}-${batchStart.day.toString().padLeft(2, '0')}",
    "batch_end": "${batchEnd.year.toString().padLeft(4, '0')}-${batchEnd.month.toString().padLeft(2, '0')}-${batchEnd.day.toString().padLeft(2, '0')}",
    "status": status,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
  };
}

class AttendanceFilterClass {
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
  dynamic updatedOn;
  dynamic updatedBy;

  AttendanceFilterClass({
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
    required this.updatedOn,
    required this.updatedBy,
  });

  factory AttendanceFilterClass.fromJson(Map<String, dynamic> json) => AttendanceFilterClass(
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
  };
}

class AttendanceFilterCourse {
  String id;
  String registrationNo;
  String courseClass;
  String status;
  String courseCode;
  String name;
  dynamic batch;
  String teacher;
  String courseRequirements;
  String courseDescription;
  String courseOutcomes;
  dynamic type;
  dynamic price;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;

  AttendanceFilterCourse({
    required this.id,
    required this.registrationNo,
    required this.courseClass,
    required this.status,
    required this.courseCode,
    required this.name,
    required this.batch,
    required this.teacher,
    required this.courseRequirements,
    required this.courseDescription,
    required this.courseOutcomes,
    required this.type,
    required this.price,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory AttendanceFilterCourse.fromJson(Map<String, dynamic> json) => AttendanceFilterCourse(
    id: json["id"],
    registrationNo: json["registration_no"],
    courseClass: json["class"],
    status: json["status"],
    courseCode: json["course_code"],
    name: json["name"],
    batch: json["batch"],
    teacher: json["teacher"],
    courseRequirements: json["course_requirements"],
    courseDescription: json["course_description"],
    courseOutcomes: json["course_outcomes"],
    type: json["type"],
    price: json["price"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "class": courseClass,
    "status": status,
    "course_code": courseCode,
    "name": name,
    "batch": batch,
    "teacher": teacher,
    "course_requirements": courseRequirements,
    "course_description": courseDescription,
    "course_outcomes": courseOutcomes,
    "type": type,
    "price": price,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}
