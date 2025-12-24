import 'dart:convert';

AdminHomeDashboardModel adminHomeDashboardModelFromJson(String str) => AdminHomeDashboardModel.fromJson(json.decode(str));

String adminHomeDashboardModelToJson(AdminHomeDashboardModel data) => json.encode(data.toJson());

class AdminHomeDashboardModel {
  bool success;
  Data data;

  AdminHomeDashboardModel({
    required this.success,
    required this.data,
  });

  factory AdminHomeDashboardModel.fromJson(Map<String, dynamic> json) => AdminHomeDashboardModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String totalMaleInstructors;
  String totalFemaleInstructors;
  String totalMaleStudents;
  String totalFemaleStudents;
  String toDoList;
  String totalBatches;
  String totalInstitutes;
  String totalStudents;
  String totalInstructors;
  String totalCourses;
  String totalTimeTables;
  String totalTickets;
  String totalEnrollments;
  String totalClasses;
  String totalUsers;
  String totalAttendance;
  String totalNotification;
  List<ClassEnrollmentChartDatum> classEnrollmentChartData;
  String totalInvoicesPaid;
  int totalAmountPaid;
  String totalInvoicesPending;
  int totalAmountPending;
  List<ActiveClass> activeClasses;
  String currentTime;
  CurrentUser currentUser;

  Data({
    required this.totalMaleInstructors,
    required this.totalFemaleInstructors,
    required this.totalMaleStudents,
    required this.totalFemaleStudents,
    required this.toDoList,
    required this.totalBatches,
    required this.totalInstitutes,
    required this.totalStudents,
    required this.totalInstructors,
    required this.totalCourses,
    required this.totalTimeTables,
    required this.totalTickets,
    required this.totalEnrollments,
    required this.totalClasses,
    required this.totalUsers,
    required this.totalAttendance,
    required this.totalNotification,
    required this.classEnrollmentChartData,
    required this.totalInvoicesPaid,
    required this.totalAmountPaid,
    required this.totalInvoicesPending,
    required this.totalAmountPending,
    required this.activeClasses,
    required this.currentTime,
    required this.currentUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalMaleInstructors: json["totalMaleInstructors"],
    totalFemaleInstructors: json["totalFemaleInstructors"],
    totalMaleStudents: json["totalMaleStudents"],
    totalFemaleStudents: json["totalFemaleStudents"],
    toDoList: json["toDOList"],
    totalBatches: json["totalBatches"],
    totalInstitutes: json["totalInstitutes"],
    totalStudents: json["totalStudents"],
    totalInstructors: json["totalInstructors"],
    totalCourses: json["totalCourses"],
    totalTimeTables: json["totalTimeTables"],
    totalTickets: json["totalTickets"],
    totalEnrollments: json["totalEnrollments"],
    totalClasses: json["totalClasses"],
    totalUsers: json["totalUsers"],
    totalAttendance: json["totalAttendance"],
    totalNotification: json["totalNotification"],
    classEnrollmentChartData: List<ClassEnrollmentChartDatum>.from(json["classEnrollmentChartData"].map((x) => ClassEnrollmentChartDatum.fromJson(x))),
    totalInvoicesPaid: json["totalInvoicesPaid"],
    totalAmountPaid: json["totalAmountPaid"],
    totalInvoicesPending: json["totalInvoicesPending"],
    totalAmountPending: json["totalAmountPending"],
    activeClasses: List<ActiveClass>.from(json["activeClasses"].map((x) => ActiveClass.fromJson(x))),
    currentTime: json["currentTime"],
    currentUser: CurrentUser.fromJson(json["currentUser"]),
  );

  Map<String, dynamic> toJson() => {
    "totalMaleInstructors": totalMaleInstructors,
    "totalFemaleInstructors": totalFemaleInstructors,
    "totalMaleStudents": totalMaleStudents,
    "totalFemaleStudents": totalFemaleStudents,
    "toDOList": toDoList,
    "totalBatches": totalBatches,
    "totalInstitutes": totalInstitutes,
    "totalStudents": totalStudents,
    "totalInstructors": totalInstructors,
    "totalCourses": totalCourses,
    "totalTimeTables": totalTimeTables,
    "totalTickets": totalTickets,
    "totalEnrollments": totalEnrollments,
    "totalClasses": totalClasses,
    "totalUsers": totalUsers,
    "totalAttendance": totalAttendance,
    "totalNotification": totalNotification,
    "classEnrollmentChartData": List<dynamic>.from(classEnrollmentChartData.map((x) => x.toJson())),
    "totalInvoicesPaid": totalInvoicesPaid,
    "totalAmountPaid": totalAmountPaid,
    "totalInvoicesPending": totalInvoicesPending,
    "totalAmountPending": totalAmountPending,
    "activeClasses": List<dynamic>.from(activeClasses.map((x) => x.toJson())),
    "currentTime": currentTime,
    "currentUser": currentUser.toJson(),
  };
}

class ActiveClass {
  String id;
  String timetableId;
  String title;
  String day;
  String startTime;
  String endTime;
  String course;
  String instructor;
  String activeClassClass;
  String addedOn;
  String addedBy;
  String updatedOn;
  String updatedBy;

  ActiveClass({
    required this.id,
    required this.timetableId,
    required this.title,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.course,
    required this.instructor,
    required this.activeClassClass,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory ActiveClass.fromJson(Map<String, dynamic> json) => ActiveClass(
    id: json["id"],
    timetableId: json["timetable_id"],
    title: json["title"],
    day: json["day"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    course: json["course"],
    instructor: json["instructor"],
    activeClassClass: json["class"],
    addedOn: json["added_on"] ?? "",
    addedBy: json["added_by"],
    updatedOn: json["updated_on"] ?? '',
    updatedBy: json["updated_by"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "timetable_id": timetableId,
    "title": title,
    "day": day,
    "start_time": startTime,
    "end_time": endTime,
    "course": course,
    "instructor": instructor,
    "class": activeClassClass,
    "added_on": addedOn,
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class ClassEnrollmentChartDatum {
  String id;
  String name;
  String batch;
  String totalEnrollments;

  ClassEnrollmentChartDatum({
    required this.id,
    required this.name,
    required this.batch,
    required this.totalEnrollments,
  });

  factory ClassEnrollmentChartDatum.fromJson(Map<String, dynamic> json) => ClassEnrollmentChartDatum(
    id: json["id"],
    name: json["name"],
    batch: json["batch"],
    totalEnrollments: json["total_enrollments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "batch": batch,
    "total_enrollments": totalEnrollments,
  };
}

class CurrentUser {
  int iat;
  int exp;
  String userId;
  String email;
  String name;

  CurrentUser({
    required this.iat,
    required this.exp,
    required this.userId,
    required this.email,
    required this.name,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
    iat: json["iat"],
    exp: json["exp"],
    userId: json["user_id"],
    email: json["email"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iat": iat,
    "exp": exp,
    "user_id": userId,
    "email": email,
    "name": name,
  };
}
