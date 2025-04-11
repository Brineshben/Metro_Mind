import 'package:get/get.dart';

import '../Controller/Login_Controller.dart';

class HandleControllers {
  static createGetControllers() {
    Get.put(UserAuthController());

  }

  static deleteAllGetControllers() async{
   await Get.delete<UserAuthController>();

  }
}
