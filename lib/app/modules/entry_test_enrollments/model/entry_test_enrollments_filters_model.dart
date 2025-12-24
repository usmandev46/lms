import 'dart:convert';

EntryTestEnrollmentsFiltersModel entryTestEnrollmentsFiltersModelFromJson(String str) => EntryTestEnrollmentsFiltersModel.fromJson(json.decode(str));

String entryTestEnrollmentsFiltersModelToJson(EntryTestEnrollmentsFiltersModel data) => json.encode(data.toJson());

class EntryTestEnrollmentsFiltersModel {
  bool success;
  Filters filters;

  EntryTestEnrollmentsFiltersModel({
    required this.success,
    required this.filters,
  });

  factory EntryTestEnrollmentsFiltersModel.fromJson(Map<String, dynamic> json) => EntryTestEnrollmentsFiltersModel(
    success: json["success"],
    filters: Filters.fromJson(json["filters"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "filters": filters.toJson(),
  };
}

class Filters {
  List<EntryTestEnrollmentsFilterBatch> batches;
  List<EntryTestEnrollmentsFilterEntryTest> entryTests;
  List<EntryTestEnrollmentsFilterCourse> courses;
  List<EntryTestEnrollmentsFilterStatusList> statusList;

  Filters({
    required this.batches,
    required this.entryTests,
    required this.courses,
    required this.statusList,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    batches: List<EntryTestEnrollmentsFilterBatch>.from(json["batches"].map((x) => EntryTestEnrollmentsFilterBatch.fromJson(x))),
    entryTests: List<EntryTestEnrollmentsFilterEntryTest>.from(json["entry_tests"].map((x) => EntryTestEnrollmentsFilterEntryTest.fromJson(x))),
    courses: List<EntryTestEnrollmentsFilterCourse>.from(json["courses"].map((x) => EntryTestEnrollmentsFilterCourse.fromJson(x))),
    statusList: List<EntryTestEnrollmentsFilterStatusList>.from(json["status_list"].map((x) => EntryTestEnrollmentsFilterStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "batches": List<dynamic>.from(batches.map((x) => x.toJson())),
    "entry_tests": List<dynamic>.from(entryTests.map((x) => x.toJson())),
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "status_list": List<dynamic>.from(statusList.map((x) => x.toJson())),
  };
}

class EntryTestEnrollmentsFilterBatch {
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

  EntryTestEnrollmentsFilterBatch({
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

  factory EntryTestEnrollmentsFilterBatch.fromJson(Map<String, dynamic> json) => EntryTestEnrollmentsFilterBatch(
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

class EntryTestEnrollmentsFilterCourse {
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

  EntryTestEnrollmentsFilterCourse({
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

  factory EntryTestEnrollmentsFilterCourse.fromJson(Map<String, dynamic> json) => EntryTestEnrollmentsFilterCourse(
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

class EntryTestEnrollmentsFilterEntryTest {
  String id;
  String registrationNo;
  String title;
  String status;
  String autoLock;
  String batch;
  dynamic technology;
  String course;
  String duration;
  DateTime date;
  String startTime;
  String endTime;
  DateTime? enrollmentDate;
  DateTime? courseEnrollmentLastDate;
  String totalMarks;
  String passingMarks;
  String passingPercentage;
  String questionType;
  String instructions;
  DateTime addedOn;
  String addedBy;
  String updatedOn;
  String updatedBy;

  EntryTestEnrollmentsFilterEntryTest({
    required this.id,
    required this.registrationNo,
    required this.title,
    required this.status,
    required this.autoLock,
    required this.batch,
    required this.technology,
    required this.course,
    required this.duration,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.enrollmentDate,
    this.courseEnrollmentLastDate,
    required this.totalMarks,
    required this.passingMarks,
    required this.passingPercentage,
    required this.questionType,
    required this.instructions,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory EntryTestEnrollmentsFilterEntryTest.fromJson(Map<String, dynamic> json) => EntryTestEnrollmentsFilterEntryTest(
    id: json["id"],
    registrationNo: json["registration_no"],
    title: json["title"],
    status: json["status"],
    autoLock: json["auto_lock"],
    batch: json["batch"],
    technology: json["technology"],
    course: json["course"],
    duration: json["duration"],
    date: DateTime.parse(json["date"]),
    startTime: json["start_time"],
    endTime: json["end_time"],
    enrollmentDate: json["enrollment_date"] != null
        ? DateTime.parse(json["enrollment_date"])
        : null,

    courseEnrollmentLastDate: json["course_enrollment_last_date"] != null
        ? DateTime.parse(json["course_enrollment_last_date"])
        : null,
    totalMarks: json["total_marks"],
    passingMarks: json["passing_marks"],
    passingPercentage: json["passing_percentage"],
    questionType: json["question_type"],
    instructions: json["instructions"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"] ?? '',
    updatedBy: json["updated_by"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "title": title,
    "status": status,
    "auto_lock": autoLock,
    "batch": batch,
    "technology": technology,
    "course": course,
    "duration": duration,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_time": endTime,
    "enrollment_date": "${enrollmentDate?.year.toString().padLeft(4, '0')}-${enrollmentDate?.month.toString().padLeft(2, '0')}-${enrollmentDate?.day.toString().padLeft(2, '0')}",
    "course_enrollment_last_date": "${courseEnrollmentLastDate?.year.toString().padLeft(4, '0')}-${courseEnrollmentLastDate?.month.toString().padLeft(2, '0')}-${courseEnrollmentLastDate?.day.toString().padLeft(2, '0')}",
    "total_marks": totalMarks,
    "passing_marks": passingMarks,
    "passing_percentage": passingPercentage,
    "question_type": questionType,
    "instructions": instructions,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class EntryTestEnrollmentsFilterStatusList {
  String id;
  String name;

  EntryTestEnrollmentsFilterStatusList({
    required this.id,
    required this.name,
  });

  factory EntryTestEnrollmentsFilterStatusList.fromJson(Map<String, dynamic> json) => EntryTestEnrollmentsFilterStatusList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
