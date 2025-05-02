import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import 'Add_Doctor.dart';

class DoctorList extends StatefulWidget {
  final String token;

  const DoctorList({super.key, required this.token});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  void initState() {
    super.initState();
    Get.find<DoctorListController>().doctorListData(widget.token);
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
                "DOCTOR LIST",
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
              child: GetX<DoctorListController>(
                builder: (DoctorListController controller) {
                  if (controller.doctorList.isEmpty) {
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
                      // Disable scrolling
                      itemCount: controller.doctorList.length,
                      itemBuilder: (context, index) {
                        final doctor = controller.doctorList[index];
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
                          title: Text(
                            "DR.${doctor?.name?.toUpperCase() ?? "No Name"}",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            doctor?.role ?? "No Role",
                            style: TextStyle(
                              fontSize: 14.h,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
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
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddDoctor(token: widget.token,),
              ));
        },
        child: Container(
          height: 50.h,
          width: 110.w,
          decoration: BoxDecoration(
              color: Colorutils.userdetailcolor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            "ADD DOCTOR",
            style: TextStyle(color: Colors.white,fontSize: 14.h),
          )),
        ),
      ),
    );
  }
}
