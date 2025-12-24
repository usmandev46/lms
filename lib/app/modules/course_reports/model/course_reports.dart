import 'dart:convert';

CourseReportsModel courseReportsModelFromJson(String str) => CourseReportsModel.fromJson(json.decode(str));

String courseReportsModelToJson(CourseReportsModel data) => json.encode(data.toJson());

class CourseReportsModel {
  bool success;
  String message;
  CourseReportsData data;

  CourseReportsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CourseReportsModel.fromJson(Map<String, dynamic> json) => CourseReportsModel(
    success: json["success"],
    message: json["message"],
    data: CourseReportsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class CourseReportsData {
  List<CourseReportsCourse> courses;
  int totalCount;
  int page;
  int limit;
  int totalPages;
  // AppliedFilters appliedFilters;

  CourseReportsData({
    required this.courses,
    required this.totalCount,
    required this.page,
    required this.limit,
    required this.totalPages,
    // required this.appliedFilters,
  });

  factory CourseReportsData.fromJson(Map<String, dynamic> json) => CourseReportsData(
    courses: List<CourseReportsCourse>.from(json["courses"].map((x) => CourseReportsCourse.fromJson(x))),
    totalCount: json["total_count"],
    page: json["page"],
    limit: json["limit"],
    totalPages: json["total_pages"],
    // appliedFilters: AppliedFilters.fromJson(json["applied_filters"]),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "total_count": totalCount,
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
    // "applied_filters": appliedFilters.toJson(),
  };
}

class AppliedFilters {
  String instructor;
  String type;

  AppliedFilters({
    required this.instructor,
    required this.type,
  });

  factory AppliedFilters.fromJson(Map<String, dynamic> json) => AppliedFilters(
    instructor: json["instructor"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "instructor": instructor,
    "type": type,
  };
}

class CourseReportsCourse {
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
  String totalChapters;
  String totalLessons;
  String totalAssignments;
  String totalEnrollments;

  CourseReportsCourse({
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
    required this.totalChapters,
    required this.totalLessons,
    required this.totalAssignments,
    required this.totalEnrollments,
  });

  factory CourseReportsCourse.fromJson(Map<String, dynamic> json) => CourseReportsCourse(
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
    totalChapters: json["total_chapters"],
    totalLessons: json["total_lessons"],
    totalAssignments: json["total_assignments"],
    totalEnrollments: json["total_enrollments"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "registration_no": registrationNo,
    "class": courseClass,
    "status": status,
    "course_code": courseCode,
    "name": name,
    // "batch": batch,
    "teacher": teacher,
    "course_requirements": courseRequirements,
    "course_description": courseDescription,
    "course_outcomes": courseOutcomes,
    "total_chapters": totalChapters,
    "total_lessons": totalLessons,
    "total_assignments": totalAssignments,
    "total_enrollments": totalEnrollments,
    "type": type,
    "price": price,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}
