class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }
///BaseURL
//   static String baseURL = "http://192.168.1.48:8001";
  static String baseURL = "http://192.168.1.30:8000";

  ///URLS
  static String login = "/accounts/login/";
  static String registerPatient = "/accounts/register/";
  static String patientQueue = "/assign_doctor/new/patience/list/";
  static String doctorList = "/doctors/list/doctors/";
  static String consultDoctorList = "/doctors/list/consult/doctors/";
  static String addDoctorToPatient = "/assign_doctor/assign-doctor/";
  static String addSlot = "/booking/list/all/slots/";
  static String addDoctor = "/doctors/register/doctor/";
}