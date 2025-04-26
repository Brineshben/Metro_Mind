import 'dart:convert';

import '../utils/Api_Constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();

  factory ApiServices() {
    return _instance;
  }

  ///patient Register PAge
  static Future<Map<String, dynamic>> patientRegister({
    required String name,
    required String userName,
    required String email,
    required String mobileNumber,
    required String password,
    required String confirmPassword,
    required String age,
    required String gender,
    required String occupation,
    required String address,
    required String education,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.registerPatient}";
    print("patient Register PAge$url");
    Map apiBody = {
      "name": name,
      "username": userName,
      "email": email,
      "mobile_number": mobileNumber,
      "password": password,
      "confirm_password": confirmPassword,
      "age": age,
      "gender": gender,
      "occupation": occupation,
      "education": education,

      // "medical_report": psw,
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = (json.encode(apiBody));
    request.headers.addAll({'Content-Type': 'application/json'});
    print('Api body---------------------->${request.body}');
    http.StreamedResponse response = await request.send();
    var respString = await response.stream.bytesToString();
    print('Api body---------------------->${json.decode(respString)}');
    return json.decode(respString);
  }

  ///Add Doctor
  static Future<Map<String, dynamic>> doctorRegister({
    required String token,
    required String name,
    required String userName,
    required String email,
    required String mobileNumber,
    required String password,
    required String role,
    required String age,
    required String gender,
    required String occupation,
    required String address,
    required String education,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addDoctor}";
    print("add doctor$url");
    Map apiBody = {
      "name": name,
      "username": userName,
      "email": email,
      "mobile_number": mobileNumber,
      "password": password,
      "role": role,
      "age": age,
      "gender": gender,
      "occupation": occupation,
      "education": education,
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = (json.encode(apiBody));
    request.headers.addAll(
      {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
    );
    print('Api body-----Add Doctor----------------->${request.body}');
    http.StreamedResponse response = await request.send();
    var respString = await response.stream.bytesToString();
    print(
        'Api body-----Add Doctorresponse----------------->${json.decode(respString)}');
    return json.decode(respString);
  }

  ///login
  static Future<Map<String, dynamic>> userLogin({
    required String userName,
    required String psw,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.login}";
    print(url);
    Map apiBody = {
      "email": userName,
      "password": psw,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});
      print('LOGIN API BODY------>${request.body}');
      http.StreamedResponse response = await request.send();
      print('LOGIN API BODY RESPONSE--------------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Patient Queue
  static Future<Map<String, dynamic>> patientQueue({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.patientQueue}";
    print("Patient Queue Response---$url");
    print("token---$token");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Patient Queue Response------->${response}');

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Appointment
  static Future<Map<String, dynamic>> addAppointment({
    required String token,
    required int doctor,
    required String date,
    required int patient,
    required int slot,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addAppointment}";
    print("Add Appointment---$url");
    Map apiBody = {
      "doctor": doctor,
      "patient": patient,
      "date": date,
      "slot": slot,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Patient Queue Response------->${request.body}');

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();
      print('Patient Queue Response------->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///DOCTOR LIST
  static Future<Map<String, dynamic>> doctorList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.doctorList}";
    print("Doctor List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Patient Queue Response------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Consult DOCTOR LIST
  static Future<Map<String, dynamic>> consultDoctorList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.consultDoctorList}";
    print("consultDoctorList List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('consultDoctorList------>${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///Shedule List
  static Future<Map<String, dynamic>> SheduleList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.sheduleModel}";
    print("Shedule Listt---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Shedule List------>${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///Assigned doctorPatients
  static Future<Map<String, dynamic>> AssignedDoctorPatientList({
    required String token,
    required int patientId,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.assignedDoctorAppointnmentList}$patientId/";
    print("Assigned doctorPatientsList---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Assigned doctorPatientsList----->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Assigned doctorPatientsList");
    }
  }

  ///AddDoctorToPatient
  static Future<Map<String, dynamic>> addDoctorToPatient({
    required String token,
    required int patientId,
    required int doctorId,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.addDoctorToPatient}$patientId/";
    print(url);
    Map apiBody = {
      "doctor": doctorId,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      print('request.body------>${request.body}');

      http.StreamedResponse response = await request.send();
      print('response api-datat-------->${response.headers}');

      var respString = await response.stream.bytesToString();
      print('adddoctortopatient response api--------->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///JuniorDashboardCount
  static Future<Map<String, dynamic>> juniorDashboard({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.juniorDashboard}";
    print("url------------------->$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      print('request.body------>${request.body}');
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print("respString------------------->$respString");

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Quotes
  static Future<Map<String, dynamic>> Quotes({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.quotes}";
    print(url);

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      print('request.body-quotes----->${request.body}');
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///AddObservationt
  static Future<Map<String, dynamic>> addObservation({
    required String token,
    required String observation,
    required int patientId,
    required int doctorId,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addObservation}";
    print('URL---->${url}');
    Map apiBody = {
      "doctor": doctorId,
      "patient": patientId,
      "observations": observation,
    };
    try {
      print('apiBodyapiBodyapiBody---->${apiBody}');
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('apiBodyapiBodyapiBody---->${request.body}');

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot
  static Future<Map<String, dynamic>> addSlot({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addSlot}";
    print(url);

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot to patient
  static Future<Map<String, dynamic>> addSlotPatient({
    required String token,
    required String doctorName,
    required String date,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.addPatient}?doctor_name=$doctorName&date=$date";
    print("Request URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot Medicine
  static Future<Map<String, dynamic>> addMedicine({
    required String token,

  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.medicineList}";
    print("Medicine URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }
}
