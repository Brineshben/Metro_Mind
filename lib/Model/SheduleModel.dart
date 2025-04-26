class SheduleModel {
  String? status;
  String? message;
  List<Data>? data;

  SheduleModel({this.status, this.message, this.data});

  SheduleModel.fromJson(Map<String, dynamic> json) {
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
  int? doctor;
  String? doctorName;
  String? doctorRole;
  int? patient;
  String? patientId;
  String? patientName;
  String? aiSummary;
  String? session;
  String? observations;
  bool? isActive;
  String? assignedAt;

  Data(
      {this.id,
        this.doctor,
        this.doctorName,
        this.doctorRole,
        this.patient,
        this.patientId,
        this.patientName,
        this.aiSummary,
        this.session,
        this.observations,
        this.isActive,
        this.assignedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    doctorName = json['doctor_name'];
    doctorRole = json['doctor_role'];
    patient = json['patient'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    aiSummary = json['ai_summary'];
    session = json['session'];
    observations = json['observations'];
    isActive = json['is_active'];
    assignedAt = json['assigned_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor'] = this.doctor;
    data['doctor_name'] = this.doctorName;
    data['doctor_role'] = this.doctorRole;
    data['patient'] = this.patient;
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['ai_summary'] = this.aiSummary;
    data['session'] = this.session;
    data['observations'] = this.observations;
    data['is_active'] = this.isActive;
    data['assigned_at'] = this.assignedAt;
    return data;
  }
}