import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../Model/Medicine_model/AddMedicineModel.dart';
import '../../Roles_UI/UI/Common_Widget/popups.dart';
import '../../Service/Api_Service.dart';



class AddMedicineController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<AddMedicineModel?> medicineListdata = Rx(null);
  RxList<MedicinesList> addMedicineData =<MedicinesList>[MedicinesList()].obs;

  // RxList<Data?> medicineList = RxList();
  // RxList<Data?> scheduleListCopy = RxList();

  Future<void> addmedicineDataz(String token, int patientId) async {
    print("---medicine");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      AddMedicineModel addMedicineModel = AddMedicineModel(
        patient: patientId,
        medicines: addMedicineData.map((medicine) => Medicines(
          medicine: medicine.medicine?.id,
          brand: medicine.brand?.id,
          frequency: medicine.frequency?.id,
          dosage: medicine.dosage,
          period: medicine.period,
          quantity: medicine.quantity,
          remarks: medicine.remarks,
          route: medicine.route,
          strength: medicine.strength,
          uom: medicine.uom,
          isActive: true,
        )).toList(),
      );
      print("---medicine addMedicineModel-------$addMedicineModel");

      Map<String, dynamic> resp = await ApiServices.addMedicineList(token: token, addData: addMedicineModel);
      print("---medicine resp-------$resp");
      if (resp['status'] == 'ok') {
        // succ
        ProductAppPopUps.submit(
          title: "SUCCESS",
          message: "medicine added successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }

}
