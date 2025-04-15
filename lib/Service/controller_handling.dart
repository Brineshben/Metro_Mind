import 'package:get/get.dart';

import '../Controller/Doctor_List_Controller.dart';
import '../Controller/Login_Controller.dart';
import '../Controller/Patient_queue_Controller.dart';

class HandleControllers {
  static createGetControllers() {
    Get.put(UserAuthController());
    Get.put(PatientQueueController());
    Get.put(DoctorListController());

  }

  static deleteAllGetControllers() async{
   await Get.delete<UserAuthController>();
   await Get.delete<PatientQueueController>();
   await Get.delete<DoctorListController>();

  }
}
