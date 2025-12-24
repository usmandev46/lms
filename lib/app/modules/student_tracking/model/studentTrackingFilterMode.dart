import 'dart:convert';

StudentTrackingFilterModel studentTrackingFilterModelFromJson(String str) => StudentTrackingFilterModel.fromJson(json.decode(str));

String studentTrackingFilterModelToJson(StudentTrackingFilterModel data) => json.encode(data.toJson());

class StudentTrackingFilterModel {
  bool success;
  TrackingFilters filters;

  StudentTrackingFilterModel({
    required this.success,
    required this.filters,
  });

  factory StudentTrackingFilterModel.fromJson(Map<String, dynamic> json) => StudentTrackingFilterModel(
    success: json["success"],
    filters: TrackingFilters.fromJson(json["filters"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "filters": filters.toJson(),
  };
}

class TrackingFilters {
  List<TrackingCourse> courses;
  List<TrackingStatus> statuses;

  TrackingFilters({
    required this.courses,
    required this.statuses,
  });

  factory TrackingFilters.fromJson(Map<String, dynamic> json) => TrackingFilters(
    courses: List<TrackingCourse>.from(json["courses"].map((x) => TrackingCourse.fromJson(x))),
    statuses: List<TrackingStatus>.from(json["statuses"].map((x) => TrackingStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "statuses": List<dynamic>.from(statuses.map((x) => x.toJson())),
  };
}

class TrackingCourse {
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

  TrackingCourse({
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

  factory TrackingCourse.fromJson(Map<String, dynamic> json) => TrackingCourse(
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

class TrackingStatus {
  String value;
  String label;

  TrackingStatus({
    required this.value,
    required this.label,
  });

  factory TrackingStatus.fromJson(Map<String, dynamic> json) => TrackingStatus(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}
