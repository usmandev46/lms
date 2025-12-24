import 'dart:convert';

StudentFilterModel studentFilterModelFromJson(String str) =>
    StudentFilterModel.fromJson(json.decode(str));

String studentFilterModelToJson(StudentFilterModel data) =>
    json.encode(data.toJson());

class StudentFilterModel {
  bool success;
  Filters filters;

  StudentFilterModel({required this.success, required this.filters});

  factory StudentFilterModel.fromJson(Map<String, dynamic> json) =>
      StudentFilterModel(
        success: json["success"],
        filters: Filters.fromJson(json["filters"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "filters": filters.toJson(),
  };
}

class Filters {
  List<Map<String, String?>> institutes;
  List<City> cities;
  List<Centers> provinces;
  List<District> districts;
  List<District> tehsils;
  List<Centers> centers;
  List<Centers> degrees;
  List<Centers> timeSlots;
  List<Course> courses;
  List<Centers> concentrations;
  List<Centers> salaries;
  List<Gender> genders;
  List<Gender> status;

  Filters({
    required this.institutes,
    required this.cities,
    required this.provinces,
    required this.districts,
    required this.tehsils,
    required this.centers,
    required this.degrees,
    required this.timeSlots,
    required this.courses,
    required this.concentrations,
    required this.salaries,
    required this.genders,
    required this.status,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    institutes: List<Map<String, String?>>.from(
      json["institutes"].map(
        (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)),
      ),
    ),
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    provinces: List<Centers>.from(
      json["provinces"].map((x) => Centers.fromJson(x)),
    ),
    centers: List<Centers>.from(
      json["centers"].map((x) => Centers.fromJson(x)),
    ),
    degrees: List<Centers>.from(
      json["degrees"].map((x) => Centers.fromJson(x)),
    ),
    timeSlots: List<Centers>.from(
      json["time_slots"].map((x) => Centers.fromJson(x)),
    ),
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
    concentrations: List<Centers>.from(
      json["concentrations"].map((x) => Centers.fromJson(x)),
    ),
    salaries: List<Centers>.from(
      json["salaries"].map((x) => Centers.fromJson(x)),
    ),
    genders: [
      Gender(id: "1", name: "Male"),
      Gender(id: "2", name: "Female"),
    ],
    status: [
      Gender(id: "1", name: "Yes"),
      Gender(id: "2", name: "No"),
    ], districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
    tehsils: List<District>.from(json["tehsils"].map((x) => District.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "institutes": List<dynamic>.from(
      institutes.map(
        (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)),
      ),
    ),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
    "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
    "tehsils": List<dynamic>.from(tehsils.map((x) => x.toJson())),
    "centers": List<dynamic>.from(centers.map((x) => x.toJson())),
    "degrees": List<dynamic>.from(degrees.map((x) => x.toJson())),
    "time_slots": List<dynamic>.from(timeSlots.map((x) => x.toJson())),
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "concentrations": List<dynamic>.from(concentrations.map((x) => x.toJson())),
    "salaries": List<dynamic>.from(salaries.map((x) => x.toJson())),
  };
}

class Centers {
  String id;
  String? name;
  String status;
  dynamic addedOn;
  String addedBy;
  DateTime? updatedOn;
  String? updatedBy;
  String? title;

  Centers({
    required this.id,
    this.name,
    required this.status,
    required this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
    this.title,
  });

  factory Centers.fromJson(Map<String, dynamic> json) => Centers(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    addedOn: json["added_on"],
    addedBy: json["added_by"],
    updatedOn: json["updated_on"] == null
        ? null
        : DateTime.parse(json["updated_on"]),
    updatedBy: json["updated_by"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "added_on": addedOn,
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
    "title": title,
  };
}

class City {
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

  City({
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

  factory City.fromJson(Map<String, dynamic> json) => City(
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

class Course {
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

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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

class District {
  String id;
  String name;
  String status;
  String? district;

  District({
    required this.id,
    required this.name,
    required this.status,
    this.district,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
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

class Gender {
  String id;
  String name;

  Gender({required this.id, required this.name});

  factory Gender.fromJson(Map<String, dynamic> json) =>
      Gender(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
