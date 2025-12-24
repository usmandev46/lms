import 'dart:convert';

EntryTestEnrollmentsModel entryTestEnrollmentsModelFromJson(String str) =>
    EntryTestEnrollmentsModel.fromJson(json.decode(str));

String entryTestEnrollmentsModelToJson(EntryTestEnrollmentsModel data) =>
    json.encode(data.toJson());

class EntryTestEnrollmentsModel {
  bool success;
  List<EntryTestEnrollmentsDatum> data;
  List<EntryEnrollmentStatusList> statusList;
  int page;
  int limit;
  int totalPages;

  EntryTestEnrollmentsModel({
    required this.success,
    required this.data,
    required this.statusList,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory EntryTestEnrollmentsModel.fromJson(Map<String, dynamic> json) {
    final parsedStatusList = (json["statusList"] as List)
        .map((x) => EntryEnrollmentStatusList.fromJson(x))
        .toList();

    return EntryTestEnrollmentsModel(
      success: json["success"],
      data: List<EntryTestEnrollmentsDatum>.from(
        json["data"].map(
              (x) => EntryTestEnrollmentsDatum.fromJson(x, parsedStatusList),
        ),
      ),
      statusList: parsedStatusList,
      page: int.tryParse(json["page"].toString()) ?? 0,
      limit: int.tryParse(json["limit"].toString()) ?? 0,
      totalPages: int.tryParse(json["total_pages"].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "statusList": List<dynamic>.from(statusList.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class EntryTestEnrollmentsDatum {
  String id;
  String testRegistrationNo;
  String studentRegistrationNo;
  String status;
  String statusName;
  String remarks;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String testName;
  dynamic studentName;
  dynamic studentEmail;
  dynamic studentDob;
  dynamic studentCnic;
  dynamic studentMobile;
  dynamic studentFatherName;
  dynamic studentRegistration;
  dynamic studentAddress;
  dynamic studentGender;

  EntryTestEnrollmentsDatum({
    required this.id,
    required this.testRegistrationNo,
    required this.studentRegistrationNo,
    required this.status,
    required this.statusName,
    required this.remarks,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    required this.testName,
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

  factory EntryTestEnrollmentsDatum.fromJson(
      Map<String, dynamic> json,
      List<EntryEnrollmentStatusList> statuses,
      ) {
    final rawStatus = json["status"].toString();

    return EntryTestEnrollmentsDatum(
      id: json["id"],
      testRegistrationNo: json["test_registration_no"],
      studentRegistrationNo: json["student_registration_no"],
      status: rawStatus,
      statusName: _getStatusLabel(rawStatus, statuses),
      remarks: json["remarks"] ?? "",
      addedOn: DateTime.parse(json["added_on"]),
      addedBy: json["added_by"],
      updatedOn: json["updated_on"],
      updatedBy: json["updated_by"],
      testName: json["test_name"],
      studentName: json["student_name"],
      studentEmail: json["student_email"],
      studentDob: json["student_dob"],
      studentCnic: json["student_cnic"],
      studentMobile: json["student_mobile"],
      studentFatherName: json["student_father_name"],
      studentRegistration: json["student_registration"],
      studentAddress: json["student_address"],
      studentGender: json["student_gender"],
    );
  }

  Map<String, dynamic> toJson() => {
    // "id": id,
    "test_name": testName,
    "student_name": studentName,
    "student_email": studentEmail,
    "student_dob": studentDob,
    "student_cnic": studentCnic,
    "student_mobile": studentMobile,
    "student_father_name": studentFatherName,
    "student_registration": studentRegistration,
    "student_address": studentAddress,
    "student_gender": studentGender,
    "test_registration_no": testRegistrationNo,

    "student_registration_no": studentRegistrationNo,
    // "status": status,
    "statusName": statusName,
    // "remarks": remarks,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,

  };
}

class EntryEnrollmentStatusList {
  String value; // id
  String label; // name

  EntryEnrollmentStatusList({
    required this.value,
    required this.label,
  });

  factory EntryEnrollmentStatusList.fromJson(Map<String, dynamic> json) =>
      EntryEnrollmentStatusList(
        value: json["id"].toString(),
        label: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
    "id": value,
    "name": label,
  };
}

String _getStatusLabel(
    String value,
    List<EntryEnrollmentStatusList> statuses,
    ) {
  try {
    final match = statuses.firstWhere(
          (e) => e.value == value,
    );
    return match.label;
  } catch (e) {
    return "";
  }
}
