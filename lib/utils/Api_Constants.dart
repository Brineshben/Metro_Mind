class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }
///BaseURL
//   static String baseURL = "http://192.168.1.48:8001";
  static String baseURL = "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net";

  ///URLS
  static String login = "/accounts/login/";
  static String chat = "/accounts/psychiatrist-chat/";
  static String registerPatient = "/accounts/register/";
  static String patientQueue = "/assign_doctor/new/patience/list/";
  static String doctorList = "/doctors/list/doctors/";
  static String consultDoctorList = "/doctors/list/consult/doctors/";
  static String addDoctorToPatient = "/assign_doctor/assign-doctor/";
  static String addSlot = "/booking/list/all/slots/";
  static String addDoctor = "/doctors/register/doctor/";
  static String addPatient = "/appointment/slots/filter/";
  static String addAppointment = "/appointment/appointment/create/";
  static String assignedDoctorAppointnmentList = "/assign_doctor/doctor/patients/list/";
  static String addObservation = "/doctor_observations/observation/create/";
  static String sheduleModel = "/doctor_observations/doctor-observations/";
  static String juniorDashboard = "/counts/admin/dashboard/count/";
  static String quotes = "/accounts/quotes";
  static String medicineList = "/medicine/medicine/list/";
  static String brand = "/medicine/brand/list/";
  static String frequency = "/medicine/frequency/list/";
  static String sendOtp = "/accounts/send_otp/";
  static String sddMedicineList = "/medicine_assign/add-medicines/";
}