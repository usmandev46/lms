import 'dart:convert';

StudentTrackingModel studentTrackingModelFromJson(String str) => StudentTrackingModel.fromJson(json.decode(str));

String studentTrackingModelToJson(StudentTrackingModel data) => json.encode(data.toJson());

class StudentTrackingModel {
  bool success;
  List<StudentTrackingDatum> data;
  List<StudentsFilterStatus> studentsFilterStatus;
  int page;
  int limit;
  int totalPages;

  StudentTrackingModel({
    required this.success,
    required this.data,
    required this.studentsFilterStatus,
    required this.page,
    required this.limit,
    required this.totalPages,

  });

  factory StudentTrackingModel.fromJson(Map<String, dynamic> json) {
    final statusList = (json["student_filter_status"] ?? [])
        .map<StudentsFilterStatus>((x) => StudentsFilterStatus.fromJson(x))
        .toList();

    final dataList = (json["data"] ?? [])
        .map<StudentTrackingDatum>(
            (x) => StudentTrackingDatum.fromJson(x, statusList))
        .toList();
    return StudentTrackingModel(
      success: json["success"] ?? false,
      data: dataList,
      studentsFilterStatus: statusList,
      page: json["page"],
      limit: json["limit"],
      totalPages: json["total_pages"],
    );
  }


  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "student_filter_status": List<dynamic>.from(studentsFilterStatus.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class StudentTrackingDatum {
  String id;
  String batch;
  String datumClass;
  String student;
  dynamic course;
  String testimony;
  String status;
  String statusName;
  dynamic remarks;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String studentName;
  String studentEmail;
  String studentCnic;
  dynamic courseName;
  String className;

  StudentTrackingDatum({
    required this.id,
    required this.batch,
    required this.datumClass,
    required this.student,
    required this.course,
    required this.testimony,
    required this.status,
    required this.statusName,
    required this.remarks,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    required this.studentName,
    required this.studentEmail,
    required this.studentCnic,
    required this.courseName,
    required this.className,
  });

  factory StudentTrackingDatum.fromJson(
      Map<String, dynamic> json, List<StudentsFilterStatus> statusList) {
    String rawStatus = json["status"]?.toString() ?? "";

    String mappedLabel = rawStatus;
    try {
      mappedLabel = statusList.firstWhere((e) => e.value == rawStatus).label;
    } catch (_) {

    }

    return StudentTrackingDatum(
      id: json["id"]?.toString() ?? "",
      batch: json["batch"]?.toString() ?? "",
      datumClass: json["class"]?.toString() ?? "",
      student: json["student"]?.toString() ?? "",
      course: json["course"],
      testimony: json["testimony"]?.toString() ?? "",
      status: json["status"]?.toString() ?? "",
      statusName: mappedLabel,
      remarks: json["remarks"],
      addedOn: DateTime.tryParse(
          (json["added_on"] ?? "").toString().replaceAll(" ", "T")) ??
          DateTime.now(),
      addedBy: json["added_by"]?.toString() ?? "",
      updatedOn: json["updated_on"],
      updatedBy: json["updated_by"],
      studentName: json["student_name"]?.toString() ?? "",
      studentEmail: json["student_email"]?.toString() ?? "",
      studentCnic: json["student_cnic"]?.toString() ?? "",
      courseName: json["course_name"],
      className: json["class_name"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    // "id": id,
    "student_name": studentName,
    "student_email": studentEmail,
    "student_cnic": studentCnic,
    "course_name": courseName,
    "class_name": className,
    // "batch": batch,
    // "class": datumClass,
    // "student": student,
    // "course": course,
    // "testimony": testimony,
    // "status": status,
    "status_name": statusName,
    // "remarks": remarks,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class FiltersSent {
  String status;
  String course;

  FiltersSent({
    required this.status,
    required this.course,
  });

  factory FiltersSent.fromJson(Map<String, dynamic> json) => FiltersSent(
    status: json["status"],
    course: json["course"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "course": course,
  };
}

class StudentsFilterStatus {
  String value;
  String label;

  StudentsFilterStatus({
    required this.value,
    required this.label,
  });

  factory StudentsFilterStatus.fromJson(Map<String, dynamic> json) => StudentsFilterStatus(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}
