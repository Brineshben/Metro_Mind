import 'package:get/get.dart';
import 'package:patient/Controller/Medicine_Controller/AddMedicineController.dart';

import '../Controller/AssignedDoctorPatients_Controller.dart';
import '../Controller/Consult_Doctor_Controller.dart';
import '../Controller/DoctorToPatientController.dart';
import '../Controller/Doctor_List_Controller.dart';
import '../Controller/JuniorDashoard_Controller.dart';
import '../Controller/Login_Controller.dart';
import '../Controller/Medicine_Controller/Brand_Controller.dart';
import '../Controller/Medicine_Controller/FrequencyController.dart';
import '../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../Controller/Patient_queue_Controller.dart';
import '../Controller/Quotes_Controller.dart';
import '../Controller/SheduleController.dart';
import '../Controller/Slot_Controller.dart';
import '../Controller/Slottopateient_Controller.dart';

class HandleControllers {
  static createGetControllers() {
    Get.put(UserAuthController());
    Get.put(PatientQueueController());
    Get.put(DoctorListController());
    Get.put(ConsultDoctorListController());
    Get.put(DoctorToPatientController());
    Get.put(SlotController());
    Get.put(SlottopateientController());
    Get.put(AssignedDoctorToPatientController());
    Get.put(ScheduleController());
    Get.put(QuotesController());
    Get.put(JuniorDashboardController());
    Get.put(MedicineController());
    Get.put(BrandController());
    Get.put(FrequencyController());
    Get.put(AddMedicineController());
  }

  static deleteAllGetControllers() async {
    await Get.delete<UserAuthController>();
    await Get.delete<PatientQueueController>();
    await Get.delete<DoctorListController>();
    await Get.delete<ConsultDoctorListController>();
    await Get.delete<DoctorToPatientController>();
    await Get.delete<SlotController>();
    await Get.delete<SlottopateientController>();
    await Get.delete<AssignedDoctorToPatientController>();
    await Get.delete<ScheduleController>();
    await Get.delete<QuotesController>();
    await Get.delete<JuniorDashboardController>();
    await Get.delete<MedicineController>();
    await Get.delete<BrandController>();
    await Get.delete<FrequencyController>();
    await Get.delete<AddMedicineController>();
  }
}
