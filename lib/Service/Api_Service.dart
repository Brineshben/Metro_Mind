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
    // try {
    var request = http.Request('POST', Uri.parse(url));
    request.body = (json.encode(apiBody));
    request.headers.addAll({'Content-Type': 'application/json'});
    print('LOGIN API BODY------>${request.body}');
    http.StreamedResponse response = await request.send();
    print('LOGIN API BODY RESPONSE--------------->${response}');

    var respString = await response.stream.bytesToString();
    return json.decode(respString);

    // } catch (e) {
    //   throw Exception("Service Error");
    // }
  }












}
