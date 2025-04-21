import 'package:get/get.dart';

import '../Controller/Consult_Doctor_Controller.dart';
import '../Controller/DoctorToPatientController.dart';
import '../Controller/Doctor_List_Controller.dart';
import '../Controller/Login_Controller.dart';
import '../Controller/Patient_queue_Controller.dart';
import '../Controller/Slot_Controller.dart';

class HandleControllers {
  static createGetControllers() {
    Get.put(UserAuthController());
    Get.put(PatientQueueController());
    Get.put(DoctorListController());
    Get.put(ConsultDoctorListController());
    Get.put(DoctorToPatientController());
    Get.put(SlotController());

  }

  static deleteAllGetControllers() async{
   await Get.delete<UserAuthController>();
   await Get.delete<PatientQueueController>();
   await Get.delete<DoctorListController>();
   await Get.delete<ConsultDoctorListController>();
   await Get.delete<DoctorToPatientController>();
   await Get.delete<SlotController>();

  }
}
