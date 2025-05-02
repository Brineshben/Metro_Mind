import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/SheduleController.dart';
import 'Add_Assesment.dart';

class AssesmentListPage extends StatefulWidget {
  final String token;
  final String name;
  final String patientId;
  final int id;
  final String sevirity;
  const AssesmentListPage({super.key, required this.token, required this.name, required this.patientId, required this.id, required this.sevirity});

  @override
  State<AssesmentListPage> createState() => _AssesmentListPageState();
}

class _AssesmentListPageState extends State<AssesmentListPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ScheduleController>().scheduleDataz(widget.token);
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
                "Patient LIST",
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
              child: GetX<ScheduleController>(
                builder: (ScheduleController controller) {
                  if (controller.scheduleList.isEmpty) {
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
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.scheduleList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.scheduleList[index];
                        return Column(
                          children: [
                            ListTile(
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
                              title: Text(
                                patient?.patientName ?? "No Name",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    patient?.patientId ?? "No Name",
                                    style: TextStyle(
                                      fontSize: 14.h,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [

                                      _buildTag("EDIT", Colors.red),
                                    ],
                                  ),

                                ],
                              ),
                              onTap: () {
                                // Handle navigation or action
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                          ],
                        );
                      },
                    );


                  }
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddAssesment(name: widget.name, patientId:widget.patientId, sevirity:widget.sevirity ?? "", id: widget.id ??0, token: widget.token,);
          },));        },
        child: Icon(Icons.add,color: Colorutils.userdetailcolor,),
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
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 9.w),
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
