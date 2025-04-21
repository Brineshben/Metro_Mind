class PatientQueueModel {
  String? status;
  String? message;
  List<Data>? data;

  PatientQueueModel({this.status, this.message, this.data});

  PatientQueueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? username;
  String? email;
  String? mobileNumber;
  String? medicalReport;
  String? medicalReportUrl;
  String? role;
  int? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;
  String? patientId;
  Diagnosis? diagnosis;

  Data(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.mobileNumber,
        this.medicalReport,
        this.medicalReportUrl,
        this.role,
        this.age,
        this.gender,
        this.occupation,
        this.education,
        this.address,
        this.patientId,
        this.diagnosis});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    medicalReport = json['medical_report'];
    medicalReportUrl = json['medical_report_url'];
    role = json['role'];
    age = json['age'];
    gender = json['gender'];
    occupation = json['occupation'];
    education = json['education'];
    address = json['address'];
    patientId = json['patient_id'];
    diagnosis = json['diagnosis'] != null
        ? new Diagnosis.fromJson(json['diagnosis'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['medical_report'] = this.medicalReport;
    data['medical_report_url'] = this.medicalReportUrl;
    data['role'] = this.role;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['education'] = this.education;
    data['address'] = this.address;
    data['patient_id'] = this.patientId;
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis!.toJson();
    }
    return data;
  }
}

class Diagnosis {
  String? diagnosisSummary;
  String? chatHistory;
  String? createdAt;
  String? severity;

  Diagnosis(
      {this.diagnosisSummary, this.chatHistory, this.createdAt, this.severity});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    diagnosisSummary = json['diagnosis_summary'];
    chatHistory = json['chat_history'];
    createdAt = json['created_at'];
    severity = json['severity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnosis_summary'] = this.diagnosisSummary;
    data['chat_history'] = this.chatHistory;
    data['created_at'] = this.createdAt;
    data['severity'] = this.severity;
    return data;
  }
}