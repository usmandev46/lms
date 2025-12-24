import 'dart:convert';

CourseReportsFilterModel courseReportsFilterModelFromJson(String str) => CourseReportsFilterModel.fromJson(json.decode(str));

String courseReportsFilterModelToJson(CourseReportsFilterModel data) => json.encode(data.toJson());

class CourseReportsFilterModel {
  bool success;
  String message;
  CourseFilterData data;

  CourseReportsFilterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CourseReportsFilterModel.fromJson(Map<String, dynamic> json) => CourseReportsFilterModel(
    success: json["success"],
    message: json["message"],
    data: CourseFilterData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class CourseFilterData {
  List<Instructor> instructors;
  // List<CourseFilterCategory> technologies;
  List<Map<String, String?>> institutes;
  // List<CourseFilterCategory> subCategories;
  // List<CourseFilterCategory> categories;
  List<CourseFilterCategory> deliveryModes;
  List<CourseType> courseTypes;

  CourseFilterData({
    required this.instructors,
    // required this.technologies,
    required this.institutes,
    // required this.subCategories,
    // required this.categories,
    required this.deliveryModes,
    required this.courseTypes,
  });

  factory CourseFilterData.fromJson(Map<String, dynamic> json) => CourseFilterData(
    instructors: List<Instructor>.from(json["instructors"].map((x) => Instructor.fromJson(x))),
    // technologies: List<CourseFilterCategory>.from(json["technologies"].map((x) => CourseFilterCategory.fromJson(x))),
    institutes: List<Map<String, String?>>.from(json["institutes"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    // subCategories: List<CourseFilterCategory>.from(json["sub_categories"].map((x) => CourseFilterCategory.fromJson(x))),
    // categories: List<CourseFilterCategory>.from(json["categories"].map((x) => CourseFilterCategory.fromJson(x))),
    deliveryModes: List<CourseFilterCategory>.from(json["delivery_modes"].map((x) => CourseFilterCategory.fromJson(x))),
    courseTypes: List<CourseType>.from(json["course_types"].map((x) => CourseType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "instructors": List<dynamic>.from(instructors.map((x) => x.toJson())),
    // "technologies": List<dynamic>.from(technologies.map((x) => x.toJson())),
    "institutes": List<dynamic>.from(institutes.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    // "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    // "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "delivery_modes": List<dynamic>.from(deliveryModes.map((x) => x.toJson())),
    "course_types": List<dynamic>.from(courseTypes.map((x) => x.toJson())),
  };
}

class CourseFilterCategory {
  String id;
  String name;
  String status;
  DateTime addedOn;
  String addedBy;
  DateTime? updatedOn;
  String? updatedBy;
  String? category;
  String? details;

  CourseFilterCategory({
    required this.id,
    required this.name,
    required this.status,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    this.category,
    this.details,
  });

  factory CourseFilterCategory.fromJson(Map<String, dynamic> json) => CourseFilterCategory(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
    updatedBy: json["updated_by"],
    category: json["category"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
    "category": category,
    "details": details,
  };
}


class CourseType {
  String value;
  String label;

  CourseType({
    required this.value,
    required this.label,
  });

  factory CourseType.fromJson(Map<String, dynamic> json) => CourseType(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Instructor {
  String id;
  String registrationNo;
  String status;
  String center;
  String name;
  String cnic;
  String mobile;
  String instructorType;
  String secondaryMobile;
  String email;
  String gender;
  String fatherName;
  String dob;
  String province;
  String district;
  String tehsil;
  String city;
  String address;
  String profilePic;
  String cv;
  dynamic minWage;
  String salaryStructure;
  String instituteId;
  String specialistSubject;
  String about;
  String organization;
  String designation;
  String startDate;
  String endDate;
  String responsibilities;
  dynamic experienceDocument;
  String basicSalary;
  String allowances;
  String totalSalary;
  String paymentFrequency;
  String bonus;
  String salaryNotes;
  DateTime addedOn;
  String addedBy;
  DateTime updatedOn;
  String updatedBy;

  Instructor({
    required this.id,
    required this.registrationNo,
    required this.status,
    required this.center,
    required this.name,
    required this.cnic,
    required this.mobile,
    required this.instructorType,
    required this.secondaryMobile,
    required this.email,
    required this.gender,
    required this.fatherName,
    required this.dob,
    required this.province,
    required this.district,
    required this.tehsil,
    required this.city,
    required this.address,
    required this.profilePic,
    required this.cv,
    required this.minWage,
    required this.salaryStructure,
    required this.instituteId,
    required this.specialistSubject,
    required this.about,
    required this.organization,
    required this.designation,
    required this.startDate,
    required this.endDate,
    required this.responsibilities,
    required this.experienceDocument,
    required this.basicSalary,
    required this.allowances,
    required this.totalSalary,
    required this.paymentFrequency,
    required this.bonus,
    required this.salaryNotes,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    registrationNo: json["registration_no"],
    status: json["status"],
    center: json["center"],
    name: json["name"],
    cnic: json["cnic"],
    mobile: json["mobile"],
    instructorType: json["instructor_type"],
    secondaryMobile: json["secondary_mobile"],
    email: json["email"],
    gender: json["gender"],
    fatherName: json["father_name"],
    dob: json["dob"],
    province: json["province"],
    district: json["district"],
    tehsil: json["tehsil"],
    city: json["city"],
    address: json["address"],
    profilePic: json["profile_pic"],
    cv: json["cv"],
    minWage: json["min_wage"],
    salaryStructure: json["salary_structure"],
    instituteId: json["institute_id"],
    specialistSubject: json["specialist_subject"],
    about: json["about"],
    organization: json["organization"],
    designation: json["designation"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    responsibilities: json["responsibilities"],
    experienceDocument: json["experience_document"],
    basicSalary: json["basic_salary"],
    allowances: json["allowances"],
    totalSalary: json["total_salary"],
    paymentFrequency: json["payment_frequency"],
    bonus: json["bonus"],
    salaryNotes: json["salary_notes"],
    addedOn: DateTime.parse(json["added_on"]),
    addedBy: json["added_by"],
    updatedOn: DateTime.parse(json["updated_on"]),
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "status": status,
    "center": center,
    "name": name,
    "cnic": cnic,
    "mobile": mobile,
    "instructor_type": instructorType,
    "secondary_mobile": secondaryMobile,
    "email": email,
    "gender": gender,
    "father_name": fatherName,
    "dob": dob,
    "province": province,
    "district": district,
    "tehsil": tehsil,
    "city": city,
    "address": address,
    "profile_pic": profilePic,
    "cv": cv,
    "min_wage": minWage,
    "salary_structure": salaryStructure,
    "institute_id": instituteId,
    "specialist_subject": specialistSubject,
    "about": about,
    "organization": organization,
    "designation": designation,
    "start_date": startDate,
    "end_date": endDate,
    "responsibilities": responsibilities,
    "experience_document": experienceDocument,
    "basic_salary": basicSalary,
    "allowances": allowances,
    "total_salary": totalSalary,
    "payment_frequency": paymentFrequency,
    "bonus": bonus,
    "salary_notes": salaryNotes,
    "added_on": addedOn.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn.toIso8601String(),
    "updated_by": updatedBy,
  };
}

