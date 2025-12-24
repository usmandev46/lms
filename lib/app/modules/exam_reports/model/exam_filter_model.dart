import 'dart:convert';

ExamFilterModel examFilterModelFromJson(String str) => ExamFilterModel.fromJson(json.decode(str));

String examFilterModelToJson(ExamFilterModel data) => json.encode(data.toJson());

class ExamFilterModel {
  bool success;
  ExamFiltersss filters;

  ExamFilterModel({
    required this.success,
    required this.filters,
  });

  factory ExamFilterModel.fromJson(Map<String, dynamic> json) => ExamFilterModel(
    success: json["success"],
    filters: ExamFiltersss.fromJson(json["filters"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "filters": filters.toJson(),
  };
}

class ExamFiltersss {
  List<ExamFilterCourse> courses;
  List<ExamFilterClass> classes;
  List<ExamFilterStudent> students;
  List<ExamFilterExam> exams;

  ExamFiltersss({
    required this.courses,
    required this.classes,
    required this.students,
    required this.exams,
  });

  factory ExamFiltersss.fromJson(Map<String, dynamic> json) => ExamFiltersss(
    courses: List<ExamFilterCourse>.from(json["courses"].map((x) => ExamFilterCourse.fromJson(x))),
    classes: List<ExamFilterClass>.from(json["classes"].map((x) => ExamFilterClass.fromJson(x))),
    students: List<ExamFilterStudent>.from(json["students"].map((x) => ExamFilterStudent.fromJson(x))),
    exams: List<ExamFilterExam>.from(json["exams"].map((x) => ExamFilterExam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
    "students": List<dynamic>.from(students.map((x) => x.toJson())),
    "exams": List<dynamic>.from(exams.map((x) => x.toJson())),
  };
}

class ExamFilterClass {
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
  DateTime? addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;

  ExamFilterClass({
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
     this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory ExamFilterClass.fromJson(Map<String, dynamic> json) => ExamFilterClass(
    id: json["id"] ?? '',
    registrationNo: json["registration_no"] ?? '',
    batch: json["batch"] ?? '',
    name: json["name"] ?? '',
    instructor: json["instructor"] ?? '',
    assistantInstructor: json["assistant_instructor"] ?? '',
    labEngineer: json["lab_engineer"] ?? '',
    course: json["course"] ?? '',
    status: json["status"] ?? '',
    classCapacity: json["class_capacity"] ?? '',
    classRoom: json["class_room"] ?? '',
    addedOn: json["added_on"] != null ? DateTime.parse(json["added_on"]) : null,
    addedBy: json["added_by"] ?? '',
    updatedOn: json["updated_on"] ?? '',
    updatedBy: json["updated_by"] ?? '',
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
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class ExamFilterCourse {
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
  DateTime? addedOn;
  String addedBy;
  dynamic updatedOn;
  dynamic updatedBy;

  ExamFilterCourse({
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
    this.addedOn,
    required this.addedBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory ExamFilterCourse.fromJson(Map<String, dynamic> json) => ExamFilterCourse(
    id: json["id"]  ?? '',
    registrationNo: json["registration_no"] ?? '',
    courseClass: json["class"] ?? '',
    status: json["status"] ?? '',
    courseCode: json["course_code"] ?? '',
    name: json["name"] ?? '',
    batch: json["batch"] ?? '',
    teacher: json["teacher"] ?? '',
    courseRequirements: json["course_requirements"] ?? '',
    courseDescription: json["course_description"] ?? '',
    courseOutcomes: json["course_outcomes"] ?? '',
    type: json["type"] ?? '',
    price: json["price"] ?? '',
    addedOn: json["added_on"] !=  null? DateTime.parse(json["added_on"]):null,
    addedBy: json["added_by"] ?? '',
    updatedOn: json["updated_on"] ?? '',
    updatedBy: json["updated_by"] ?? '',
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
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
  };
}

class ExamFilterExam {
  String id;
  String registrationNo;
  String title;
  String examType;
  dynamic examSession;
  dynamic examClass;
  String status;
  String batch;
  String course;
  dynamic chapter;
  String duration;
  DateTime? date;
  String startTime;
  String endTime;
  String totalMarks;
  String passingMarks;
  String passingPercentage;
  String questionType;
  String autolock;
  String instructions;
  DateTime? addedOn;
  String addedBy;
  DateTime? updatedOn;
  String updatedBy;

  ExamFilterExam({
    required this.id,
    required this.registrationNo,
    required this.title,
    required this.examType,
    required this.examSession,
    required this.examClass,
    required this.status,
    required this.batch,
    required this.course,
    required this.chapter,
    required this.duration,
    this.date,
    required this.startTime,
    required this.endTime,
    required this.totalMarks,
    required this.passingMarks,
    required this.passingPercentage,
    required this.questionType,
    required this.autolock,
    required this.instructions,
     this.addedOn,
    required this.addedBy,
     this.updatedOn,
    required this.updatedBy,
  });

  factory ExamFilterExam.fromJson(Map<String, dynamic> json) => ExamFilterExam(
    id: json["id"] ?? '',
    registrationNo: json["registration_no"] ?? '',
    title: json["title"] ?? '',
    examType: json["exam_type"] ?? '',
    examSession: json["exam_session"] ?? '',
    examClass: json["exam_class"] ?? '',
    status: json["status"] ?? '',
    batch: json["batch"] ?? '',
    course: json["course"] ?? '',
    chapter: json["chapter"] ?? '',
    duration: json["duration"] ?? '',
    date: json["date"] != null ? DateTime.parse(json["date"]) : null,
    startTime: json["start_time"] ?? '',
    endTime: json["end_time"] ?? '',
    totalMarks: json["total_marks"] ?? '',
    passingMarks: json["passing_marks"] ?? '',
    passingPercentage: json["passing_percentage"] ?? '',
    questionType: json["question_type"] ?? '',
    autolock: json["autolock"] ?? '',
    instructions: json["instructions"] ?? '',
    addedOn: json["added_on"] != null ? DateTime.parse(json["added_on"]) : null,
    addedBy: json["added_by"]  ?? '',
    updatedOn: json["updated_on"] != null ? DateTime.parse(json["updated_on"]) : null,
    updatedBy: json["updated_by"]  ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "title": title,
    "exam_type": examType,
    "exam_session": examSession,
    "exam_class": examClass,
    "status": status,
    "batch": batch,
    "course": course,
    "chapter": chapter,
    "duration": duration,
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_time": endTime,
    "total_marks": totalMarks,
    "passing_marks": passingMarks,
    "passing_percentage": passingPercentage,
    "question_type": questionType,
    "autolock": autolock,
    "instructions": instructions,
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
  };
}

class ExamFilterStudent {
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
  DateTime? dob;
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
  dynamic guardianId;
  DateTime? addedOn;
  String addedBy;
  DateTime? updatedOn;
  String updatedBy;
  String studentClass;
  String bloodGroup;
  String transport;

  ExamFilterStudent({
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
    this.dob,
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
    this.addedOn,
    required this.addedBy,
    this.updatedOn,
    required this.updatedBy,
    required this.studentClass,
    required this.bloodGroup,
    required this.transport,
  });

  factory ExamFilterStudent.fromJson(Map<String, dynamic> json) => ExamFilterStudent(
    id: json["id"] ?? '',
    registrationNo: json["registration_no"] ?? '',
    status: json["status"] ?? '',
    center: json["center"] ?? '',
    name: json["name"] ?? '',
    fatherName: json["father_name"] ?? '',
    cnic: json["cnic"] ?? '',
    mobile: json["mobile"] ?? '',
    secondaryMobile: json["secondary_mobile"] ?? '',
    email: json["email"] ?? '',
    dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
    gender: json["gender"] ?? '',
    feeType: json["fee_type"]  ?? '',
    surchargeType: json["surcharge_type"]  ?? '',
    province: json["province"]  ?? '',
    city: json["city"] ?? '',
    timeSlot: json["time_slot"] ?? '',
    academicConcentration: json["academic_concentration"] ?? '',
    prefferedCourseOne: json["preffered_course_one"] ?? '',
    prefferedCourseTwo: json["preffered_course_two"] ?? '',
    linkedInType: json["linkedIn_type"] ?? '',
    linkedInUrl: json["linkedIn_url"] ?? '',
    enrollmentStatus: json["enrollment_status"] ?? '',
    universityName: json["university_name"] ?? '',
    semester: json["semester"] ?? '',
    feeStructure: json["fee_structure"] ?? '',
    employmentStatus: json["employment_status"] ?? '',
    salarySlab: json["salary_slab"] ?? '',
    completeCourse: json["complete_course"] ?? '',
    degree: json["degree"] ?? '',
    address: json["address"]  ?? '',
    domicile: json["domicile"]  ?? '',
    tehsil: json["tehsil"] ?? '',
    district: json["district"] ?? '',
    guardianId: json["guardian_id"] ?? '',
    addedOn: json["added_on"] != null ? DateTime.parse(json["added_on"]) : null,
    addedBy: json["added_by"] ?? '',
    updatedOn: json["updated_on"] != null ? DateTime.parse(json["updated_on"]) : null,
    updatedBy: json["updated_by"] ?? '',
    studentClass: json["class"]  ?? '',
    bloodGroup: json["blood_group"] ?? '',
    transport: json["transport"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "registration_no": registrationNo,
    "status": status,
    "center": center,
    "name": name,
    "father_name": fatherName,
    "cnic": cnic,
    "mobile": mobile,
    "secondary_mobile": secondaryMobile,
    "email": email,
    "dob": "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "fee_type": feeType,
    "surcharge_type": surchargeType,
    "province": province,
    "city": city,
    "time_slot": timeSlot,
    "academic_concentration": academicConcentration,
    "preffered_course_one": prefferedCourseOne,
    "preffered_course_two": prefferedCourseTwo,
    "linkedIn_type": linkedInType,
    "linkedIn_url": linkedInUrl,
    "enrollment_status": enrollmentStatus,
    "university_name": universityName,
    "semester": semester,
    "fee_structure": feeStructure,
    "employment_status": employmentStatus,
    "salary_slab": salarySlab,
    "complete_course": completeCourse,
    "degree": degree,
    "address": address,
    "domicile": domicile,
    "tehsil": tehsil,
    "district": district,
    "guardian_id": guardianId,
    "added_on": addedOn?.toIso8601String(),
    "added_by": addedBy,
    "updated_on": updatedOn?.toIso8601String(),
    "updated_by": updatedBy,
    "class": studentClass,
    "blood_group": bloodGroup,
    "transport": transport,
  };
}
