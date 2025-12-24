import 'dart:convert';
import 'dart:isolate';

StudentReportsModel studentReportsModelFromJson(String str) =>
    StudentReportsModel.fromJson(json.decode(str));

String studentReportsModelToJson(StudentReportsModel data) =>
    json.encode(data.toJson());

Future<StudentReportsModel> parseStudentReports(String jsonStr) async {
  final p = ReceivePort();
  await Isolate.spawn(_parseInBackground, [p.sendPort, jsonStr]);
  return await p.first;
}

void _parseInBackground(List<dynamic> args) {
  SendPort sendPort = args[0];
  String jsonStr = args[1];
  final parsed = json.decode(jsonStr);
  final model = StudentReportsModel.fromJson(parsed);
  sendPort.send(model);
}

String yesNo(String? value) {
  if (value == null) return "";
  return value == "1" ? "Yes" : "No";
}

class StudentReportsModel {
  bool success;
  Data data;
  int page;
  int limit;
  int totalPages;

  StudentReportsModel({
    required this.success,
    required this.data,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory StudentReportsModel.fromJson(Map<String, dynamic> json) =>
      StudentReportsModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        page: json["page"],
        limit: json["limit"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "page": page,
    "limit": limit,
    "total_pages": totalPages,
  };
}

class Data {
  List<CenterData> centers;
  List<CityData> cities;
  List<DegreeData> provinces;
  List<DegreeData> districts;
  List<DegreeData> tehsils;
  List<DegreeData> degrees;
  int totalCount;
  List<Student> students;

  Map<String, String> centerMap = {};
  Map<String, String> cityMap = {};
  Map<String, String> provinceMap = {};
  Map<String, String> distrrictsMap = {};
  Map<String, String> tehsilsMap = {};
  Map<String, String> degreeMap = {};

  Data({
    required this.centers,
    required this.cities,
    required this.provinces,
    required this.districts,
    required this.tehsils,
    required this.degrees,
    required this.totalCount,
    required this.students,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final centers = List<CenterData>.from(json["centers"].map((x) => CenterData.fromJson(x)));
    final cities = List<CityData>.from(json["cities"].map((x) => CityData.fromJson(x)));
    final provinces = List<DegreeData>.from(json["provinces"].map((x) => DegreeData.fromJson(x)));
    final districts = List<DegreeData>.from(json["districts"].map((x) => DegreeData.fromJson(x)));
    final tehsils = List<DegreeData>.from(json["tehsils"].map((x) => DegreeData.fromJson(x)));
    final degrees = List<DegreeData>.from(json["degrees"].map((x) => DegreeData.fromJson(x)));

    final centerMap = {for (var c in centers) c.id: c.name};
    final cityMap = {for (var c in cities) c.id: c.name};
    final provinceMap = {for (var p in provinces) p.id: p.name};
    final districtMap = {for (var d in districts) d.id: d.name};
    final tehsilMap = {for (var t in tehsils) t.id: t.name};
    final degreeMap = {for (var d in degrees) d.id: d.name};

    final students = List<Student>.from(
      json["students"].map((x) => Student.fromJson(
        x,
        centerMap: centerMap,
        cityMap: cityMap,
        provinceMap: provinceMap,
        disMap: districtMap,
        tehMap: tehsilMap,
        degMap: degreeMap
      )),
    );

    return Data(
      centers: centers,
      cities: cities,
      provinces: provinces,
      districts: districts,
      tehsils: tehsils,
      degrees: degrees,
      students: students,
      totalCount: json["total_count"],
    )
      ..centerMap = centerMap
      ..cityMap = cityMap
      ..provinceMap = provinceMap
      ..distrrictsMap = districtMap
      ..tehsilsMap = tehsilMap
      ..degreeMap = degreeMap;
  }


  Map<String, dynamic> toJson() => {
    "centers": List<dynamic>.from(centers.map((x) => x.toJson())),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
    "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
    "tehsils": List<dynamic>.from(tehsils.map((x) => x.toJson())),
    "degrees": List<dynamic>.from(degrees.map((x) => x.toJson())),
    "total_count": totalCount,
    "students": List<dynamic>.from(students.map((x) => x.toJson())),
  };
}

class CenterData {
  String id;
  String name;
  String status;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;

  CenterData({
    required this.id,
    required this.name,
    required this.status,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory CenterData.fromJson(Map<String, dynamic> json) => CenterData(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class CityData {
  String id;
  String name;
  String province;
  dynamic district;
  dynamic tehsil;
  String status;
  DateTime addedOn;
  dynamic addedBy;
  dynamic updatedOn;
  dynamic updatedBy;

  CityData({
    required this.id,
    required this.name,
    required this.province,
    required this.district,
    required this.tehsil,
    required this.status,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    id: json["id"],
    name: json["name"],
    province: json["province"],
    district: json["district"],
    tehsil: json["tehsil"],
    status: json["status"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "province": province,
    "district": district,
    "tehsil": tehsil,
    "status": status,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class DegreeData {
  String id;
  String name;
  String status;
  String? district;

  DegreeData({
    required this.id,
    required this.name,
    required this.status,
    this.district,
  });

  factory DegreeData.fromJson(Map<String, dynamic> json) => DegreeData(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    district: json["district"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "district": district,
  };
}

class Student {
  String id;
  String registrationNo;
  String status;
  String center;
  String name;
  String fatherName;
  String cnic;
  String mobile;
  String secondaryMobile;
  String email;
  DateTime dob;
  String gender;
  String feeType;
  String surchargeType;
  dynamic province;
  String city;
  dynamic timeSlot;
  dynamic academicConcentration;
  dynamic prefferedCourseOne;
  dynamic prefferedCourseTwo;
  String linkedInType;
  String linkedInUrl;
  String enrollmentStatus;
  String universityName;
  String semester;
  String feeStructure;
  dynamic employmentStatus;
  dynamic salarySlab;
  dynamic completeCourse;
  String degree;
  String address;
  String domicile;
  String tehsil;
  String district;
  String guardianId;
  DateTime addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String studentClass;
  String bloodGroup;
  String transport;
  dynamic timeSlotName;
  String feeName;
  String className;
  dynamic firstCourseName;
  dynamic secondCourseName;
  String addedByUser;
  dynamic updatedByUser;
  String concentrationName;
  String employmentStatusTitle;

  Student({
    required this.id,
    required this.registrationNo,
    required this.status,
    required this.center,
    required this.name,
    required this.fatherName,
    required this.cnic,
    required this.mobile,
    required this.secondaryMobile,
    required this.email,
    required this.dob,
    required this.gender,
    required this.feeType,
    required this.surchargeType,
    required this.province,
    required this.city,
    required this.timeSlot,
    required this.academicConcentration,
    required this.prefferedCourseOne,
    required this.prefferedCourseTwo,
    required this.linkedInType,
    required this.linkedInUrl,
    required this.enrollmentStatus,
    required this.universityName,
    required this.semester,
    required this.feeStructure,
    required this.employmentStatus,
    required this.salarySlab,
    required this.completeCourse,
    required this.degree,
    required this.address,
    required this.domicile,
    required this.tehsil,
    required this.district,
    required this.guardianId,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    required this.studentClass,
    required this.bloodGroup,
    required this.transport,
    required this.timeSlotName,
    required this.feeName,
    required this.className,
    required this.firstCourseName,
    required this.secondCourseName,
    required this.addedByUser,
    required this.updatedByUser,
    required this.concentrationName,
    required this.employmentStatusTitle,
  });

  factory Student.fromJson(
    Map<String, dynamic> json, {
    Map<String, String>? centerMap,
    Map<String, String>? cityMap,
    Map<String, String>? provinceMap,
    Map<String, String>? disMap,
    Map<String, String>? tehMap,
    Map<String, String>? degMap,
  }) => Student(
    id: json["id"],
    registrationNo: json["registration_no"],
    name: json["name"],
    fatherName: json["father_name"],
    cnic: json["cnic"],
    mobile: json["mobile"],
    secondaryMobile: json["secondary_mobile"],
    email: json["email"],
    dob: DateTime.parse(json["dob"]),
    status: json["status"],
    center: centerMap?[json["center"]] ?? "",
    city: cityMap?[json["city"]] ?? "",
    province: provinceMap?[json["province"]] ?? "",
    gender: json["gender"] == "1" ? "Male" : "Female",
    feeType: json["fee_type"] == "1"
        ? "Standard"
        : json["fee_type"] == "2"
        ? "Specialized"
        : json["fee_type"] == "3"
        ? "Discounted"
        : "",
    surchargeType: json["surcharge_type"] == "1"
        ? "Surcharge"
        : json["surcharge_type"] == "2"
        ? "Monthly Fee"
        : "",
    academicConcentration: json["academic_concentration"],
    prefferedCourseOne: json["preffered_course_one"] ?? "",
    prefferedCourseTwo: json["preffered_course_two"] ?? "",
    linkedInType: yesNo(json["linkedIn_type"]),
    linkedInUrl: json["linkedIn_url"] ?? "",
    enrollmentStatus: yesNo(json["enrollment_status"]),
    universityName: json["university_name"],
    semester: json["semester"],
    feeStructure: json["fee_structure"],
    employmentStatus: json["employment_status"],
    salarySlab: json["salary_slab"],
    completeCourse: json["complete_course"],
    degree: degMap?[json["degree"]] ?? "",
    address: json["address"],
    domicile: provinceMap?[json["domicile"]] ?? "",
    tehsil: tehMap?[json["tehsil"]] ?? "",
    district: disMap?[json["district"]] ?? "",
    guardianId: json["guardian_id"] ?? '',
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    studentClass: json["class"],
    bloodGroup: json["blood_group"] ?? '',
    transport: yesNo(json["transport"]),
    timeSlotName: json["time_slot_name"],
    feeName: json["fee_name"],
    className: json["class_name"],
    firstCourseName: json["first_course_name"] ?? "",
    secondCourseName: json["second_course_name"] ?? "",
    addedByUser: json["added_by_user"],
    updatedByUser: json["updated_by_user"],
    timeSlot: json["time_slot"] ?? "",
    concentrationName: json["concentration_name"] ?? '',
    employmentStatusTitle: json["employment_status_title"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "registration_no": registrationNo,
    "name": name,
    "father_name": fatherName,
    "cnic": cnic,
    "mobile": mobile,
    "secondary_mobile": secondaryMobile,
    "email": email,
    "dob": dob.toIso8601String(),
    "gender": gender,
    "status": status,
    "center": center,
    "city": city,
    "province": province,
    "address": address,
    "domicile": domicile,
    "tehsil": tehsil,
    "district": district,
    "degree": degree,
    "fee_type": feeType,
    "surcharge_type": surchargeType,
    "time_slot_name": timeSlotName,
    "concentration_name": concentrationName,
    "employment_status_title": employmentStatusTitle,
    // "time_slot": timeSlot,
    // "academic_concentration": academicConcentration,
    // "preffered_course_one": prefferedCourseOne,
    // "preffered_course_two": prefferedCourseTwo,
    "first_course_name": firstCourseName,
    "second_course_name": secondCourseName,
    "linkedIn_type": linkedInType,
    "linkedIn_url": linkedInUrl,
    // "enrollment_status": enrollmentStatus,
    "university_name": universityName,
    "semester": semester,
    // "fee_structure": feeStructure,
    // "employment_status": employmentStatus,
    "salary_slab": salarySlab,
    "complete_course": completeCourse,
    "fee_name": feeName,
    "class_name": className,
    "blood_group": bloodGroup,
    "transport": transport,
    "added_by_user": addedByUser,
    "updated_by_user": updatedByUser,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,

  };
}

