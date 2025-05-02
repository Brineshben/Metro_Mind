import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../Controller/JuniorDashoard_Controller.dart';
import '../../../Controller/Patient_queue_Controller.dart';
import '../../../utils/color_util.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/EnquiryList_Page.dart';

class Dashchief extends StatefulWidget {
  final String token;
  final bool emergency;

  const Dashchief({super.key, required this.token, required this.emergency});

  @override
  State<Dashchief> createState() => _DashchiefState();
}

class _DashchiefState extends State<Dashchief> {

  @override
  Widget build(BuildContext context) {
    final  controller= Get.find<JuniorDashboardController>();

    return Obx(()=>
        GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10).w,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1.2, // Adjust for width/height ratio
      ),
      itemCount: controller.juniorList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle tap
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25).r,
              border: Border.all(
                color: Colorutils.userdetailcolor,
                width: 0.3,
              ),
              gradient: LinearGradient(
                colors: [Colors.teal.shade50, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(10).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  controller.juniorList[index]?.key?.toUpperCase() ?? " ",
                  style: GoogleFonts.nunito(
                    color: Colorutils.userdetailcolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.h,
                  ),
                ),
                Text(
                  controller.juniorList[index]?.value.toString() ?? "0",
                  style: GoogleFonts.nunito(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.h,
                  ),
                ),
                // Text(
                //   "(timee)",
                //   style: GoogleFonts.nunito(
                //     color: Colors.blueGrey,
                //     fontStyle: FontStyle.italic,
                //     fontWeight: FontWeight.w900,
                //     fontSize: 13.h,
                //   ),
                // ),
                (controller.juniorList[index]?.key == "Registered patients" &&controller.juniorList[index]?.value !=0 )?
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                      Get.find<PatientQueueController>().patientData(widget.token);

                      // _showDoctorBottomSheet(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'VIEW PATIENTS',
                          style: GoogleFonts.shanti(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w900,
                            fontSize: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ):SizedBox(),
                (controller.juniorList[index]?.key == "Enquires" &&controller.juniorList[index]?.value !=0 )?
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EnquirylistPage(token:widget.token,);
                      },));


                      // _showDoctorBottomSheet(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'VIEW ENQUIRIES',
                          style: GoogleFonts.shanti(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w900,
                            fontSize: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ):SizedBox()
              ],
            ),
          ),
        );
      },
    ));
  }
}
