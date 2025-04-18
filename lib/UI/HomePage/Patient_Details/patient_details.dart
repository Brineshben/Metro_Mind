import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../utils/color_util.dart';
import '../../Common_Widget/pdfview.dart';
import 'AiDetails.dart';

class PatientDetails extends StatefulWidget {
  final String name;
  final String token;
  final String patientId;
  final String age;
  final String gender;
  final String email;
  final String phone;
  final String disease;
  final String severity;
  final String diagnosissummary;

  const PatientDetails(
      {Key? key,
      required this.name,
      required this.age,
      required this.gender,
      required this.email,
      required this.phone,
      required this.disease,
      required this.severity,
      required this.diagnosissummary,
      required this.patientId, required this.token})
      : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {

  void _showDoctorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Only take needed height
            children: [
              // Top drag handle
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "DOCTOR LIST",
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 50.h,
                  decoration: const BoxDecoration(
                      border: Border(),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  width: double.infinity,
                  child: TextFormField(
                    autofocus: false,
                    // controller: textcontroller,
                    // onChanged: (value) async {
                    //   controller.resetData();
                    //   // controller.SearchNameList.value=[];
                    //   if (textcontroller.text.length >= 3) {
                    //     await controller.fetchSearchData(searchData: value);
                    //   }
                    //   // // Get.find<LeaveApprovalController>().filterLeaveList(text: value);
                    // },
                    validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Search Patients",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                "assets/images/MagnifyingGlass.svg",
                                color: Colorutils.userdetailcolor,
                              )),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colorutils.userdetailcolor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colorutils.userdetailcolor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              // Doctor list
              GetX<DoctorListController>(
                  builder: (DoctorListController controller) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  // Important for dynamic height
                  physics: NeverScrollableScrollPhysics(),
                  // Prevent scroll inside small sheet
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
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      title: Text(
                        doctor?.name ?? "",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        doctor?.role ?? "",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Handle doctor selection here
                      },
                    );
                  },
                );
              })
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal.shade50,
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 48.h, bottom: 5.h, left: 20.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      border: Border.all(
                                        color: Colors.blue, // Border color
                                        width: 0.1, // Border width
                                      ),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     blurRadius: 1,
                                      //     spreadRadius: 0,
                                      //   ),
                                      // ],
                                      borderRadius:
                                          BorderRadius.circular(15).r),
                                  child: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "PATIENT DETAILS",
                                  style: GoogleFonts.shanti(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PatientCard(
                          email: widget.email,
                          age: widget.age,
                          patientId: widget.patientId,
                          name: widget.name,
                          phone: widget.phone,
                          sevirity: widget.severity,
                          disease: widget.disease,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 25.h, left: 20.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AI Diagnosis Report",
                                style: GoogleFonts.shanti(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AiReport(
                            summary: widget.diagnosissummary,
                            details: "details"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colorutils.userdetailcolor,
                                      width: 0.5,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.teal.shade50,
                                        Colors.white
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Diagnosis Suggestion',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey)),
                                        SizedBox(height: 8),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Major Depressive Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colorutils.userdetailcolor,
                                          width: 0.5,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.teal.shade50,
                                            Colors.white
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('MSE Highlights',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey)),
                                          const SizedBox(height: 5),
                                          Text('-Mental Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                          Text('-Generalise Anxiety Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colorutils.userdetailcolor,
                                          width: 0.5,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.teal.shade50,
                                            Colors.white
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Flagged Alerts',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey)),
                                          const SizedBox(height: 5),
                                          Text('-Mental Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                          Text('-Generalise Anxiety Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Observation',
                                  style: TextStyle(
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 5.h,
                            right: 20.w,
                            bottom: 5.h,
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            maxLength: 100,
                            // controller: _Remarkscontroller,
                            validator: (val) => val!.trim().isEmpty
                                ? 'Please Enter Observation.'
                                : null,
                            decoration: InputDecoration(
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 20.w),
                                hintText: " Enter Observation   ",
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ).r,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colorutils.userdetailcolor,
                                      width: 1.0),
                                  borderRadius: const BorderRadius.all(
                                          Radius.circular(10))
                                      .r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colorutils.userdetailcolor,
                                      width: 1.0),
                                  borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0))
                                      .r,
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [Colors.teal.shade50, Colors.white],
              // Adjust colors to match your design
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.3),
                blurRadius: 0.1,
                spreadRadius: 0.1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [Colors.green.shade300, Colors.blue.shade300], // Adjust colors to match your design
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      color: Colorutils.userdetailcolor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    width: 200.w,
                    height: 45.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Recommend Specialists',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.find<DoctorListController>().doctorListData(widget.token);

                    _showDoctorBottomSheet(context);
                  },
                ),
                GestureDetector(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: Colorutils.userdetailcolor,
                            width: 0.8,
                          ),
                        ),
                        // width: 250.w,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Make Appointment',
                                style: GoogleFonts.inter(
                                  fontSize: 16.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final String name;
  final String patientId;

  final String age;
  final String email;
  final String phone;
  final String sevirity;
  final String disease;

  const PatientCard({
    Key? key,
    required this.email,
    required this.age,
    required this.patientId,
    required this.name,
    required this.phone,
    required this.sevirity,
    required this.disease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Name :', name),
            _buildTitle('Patient ID :', patientId),
            _buildTitle('Age :', age),
            _buildTitle('Email :', email),
            _buildTitle('Phone :', phone),
            _buildTitle('Disease :', disease),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        sevirity.toUpperCase(),
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class AiReport extends StatelessWidget {
  final String summary;
  final String details;

  const AiReport({
    Key? key,
    required this.summary,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SUMMARY : ",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildTitle('      ', summary),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Your onPressed code here
                  },
                  icon: Icon(Icons.download),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullScreenPdfViewer(
                          assetPath: 'assets/images/androidSDK (1).pdf',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colorutils.userdetailcolor,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        "View",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colorutils.userdetailcolor,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        "APPROVE",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
