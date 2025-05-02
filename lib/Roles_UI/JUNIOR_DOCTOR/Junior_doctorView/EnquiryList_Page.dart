import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/EnquiredListController.dart';
import '../../../Service/Api_Service.dart';
import '../../UI/Common_Widget/popups.dart';
import 'Add_Doctor.dart';

class EnquirylistPage extends StatefulWidget {
  final String token;

  const EnquirylistPage({super.key, required this.token});

  @override
  State<EnquirylistPage> createState() => EnquirylistPageState();
}

class EnquirylistPageState extends State<EnquirylistPage> {
  @override
  void initState() {
    super.initState();
    Get.find<EnquiredListController>().enquiryListData(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "ENQUIRED PATIENT LIST",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // Doctor List View
            Expanded(
              child: GetX<EnquiredListController>(
                builder: (EnquiredListController controller) {
                  if (controller.enquiryList.isEmpty) {
                    return Padding(
                        padding:
                        const EdgeInsets.only(top: 40),
                        child: Center(
                          child: const Text(
                            "Oops...No Data Found.",
                            style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic),
                          ),
                        ));
                  } else {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      itemCount: controller.enquiryList.length,
                      itemBuilder: (context, index) {
                        final patientEnquired = controller.enquiryList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(0.1),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/profile2.jpg",
                                fit: BoxFit.cover,
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patientEnquired?.name?.toUpperCase() ?? "No Name",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                patientEnquired?.mobileNumber?.toUpperCase() ?? "No Number",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              GestureDetector(   child: _buildTag("APPROVE", Colorutils.userdetailcolor),onTap: ()async {
                                  Map<String,dynamic> resp = await ApiServices.approveEnquiredList(token: widget.token, id: patientEnquired?.id?? 0);
                                  context.loaderOverlay.hide();
                                  print("----------redvffegvsp---------?$resp");
                                  if (resp['status'] == "ok") {

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => OtpScreen(
                                    //       phoneNumber: fullPhoneNumber,
                                    //     ),
                                    //   ),
                                    // );
                                    ProductAppPopUps.submit(
                                      title: "Success",
                                      // message: resp['message'] ?? 'Something went wrong.',
                                       message: "Patient Enquiry Approved Successfully.",
                                      actionName: "Close",
                                      iconData: Icons.done,
                                      iconColor: Colorutils.userdetailcolor,
                                    );
                                    Get.find<EnquiredListController>().enquiryListData(widget.token);

                                  } else {
                                    ProductAppPopUps.submit(
                                      title: "Failed",
                                      message: resp['message'] ?? 'Something went wrong.',
                                      actionName: "Close",
                                      iconData: Icons.error_outline,
                                      iconColor: Colors.red,
                                    );
                                  }
                              },),
                              SizedBox(width: 30),
                              GestureDetector(   child: _buildTag("REJECT", Colors.red),onTap: ()async {
                                Map<String,dynamic> resp = await ApiServices.rejectEnquiredList(token: widget.token, id: patientEnquired?.id?? 0);
                                context.loaderOverlay.hide();
                                print("----------redvffegvsp---------?$resp");
                                if (resp['status'] == "ok") {

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => OtpScreen(
                                  //       phoneNumber: fullPhoneNumber,
                                  //     ),
                                  //   ),
                                  // );
                                  ProductAppPopUps.submit(
                                    title: "Success",
                                    message: "Patient Enquiry Rejected Successfully.",
                                    actionName: "Close",
                                    iconData: Icons.done,
                                    iconColor: Colorutils.userdetailcolor,
                                  );
                                  Get.find<EnquiredListController>().enquiryListData(widget.token);

                                } else {
                                  ProductAppPopUps.submit(
                                    title: "Failed",
                                    message: resp['message'] ?? 'Something went wrong.',
                                    actionName: "Close",
                                    iconData: Icons.error_outline,
                                    iconColor: Colors.red,
                                  );
                                }
                              },),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    );

                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
Widget _buildTag(String text, Color bgColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 12.h,
      ),
    ),
  );
}