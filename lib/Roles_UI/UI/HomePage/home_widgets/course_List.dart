import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:get/get.dart';

import '../../../../Controller/AssignedDoctorPatients_Controller.dart';
import '../../../../utils/color_util.dart';
import '../Patient_Details/DoctorPatientDetails.dart';

class PatientsList extends StatelessWidget {
  final String name;
  final int doctorID;
  final String role;
  final String token;

  const PatientsList(
      {Key? key, required this.name, required this.role, required this.token, required this.doctorID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetX<AssignedDoctorToPatientController>(
            builder: (AssignedDoctorToPatientController controller) {return
              controller.assignedDoctorPatientList.isNotEmpty?
           Row(
            children: List.generate(controller.assignedDoctorPatientList.length,
                (index) {
              return GestureDetector(
                onTap: () {
               
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorsPatientDetails(
                        name: controller.assignedDoctorPatientList[index]
                                ?.patient?.name ??
                            "",
                        age: controller.assignedDoctorPatientList[index]
                                ?.patient?.age ??
                            0,
                        gender: controller.assignedDoctorPatientList[index]
                                ?.patient?.gender ??
                            "",
                        email: controller.assignedDoctorPatientList[index]
                                ?.patient?.email ??
                            "",
                        phone: controller.assignedDoctorPatientList[index]
                                ?.patient?.mobileNumber ??
                            "",
                        disease: 'beb',
                        // severity: controller.patientDiagnosisDetails.isNotEmpty
                        //     ? controller
                        //             .patientDiagnosisDetails[index]?.severity ??
                        //         ""
                        //     : "",
                        // diagnosissummary:
                        //     controller.patientDiagnosisDetails.isNotEmpty
                        //         ? controller.patientDiagnosisDetails.first
                        //                 ?.diagnosisSummary ??
                        //             ""
                        //         : "",
                        severity:  "HIGH",
                        diagnosissummary: "",
                        patientId: controller.assignedDoctorPatientList[index]
                                ?.patient?.patientId ??
                            "",
                        token: token,
                        id: controller.assignedDoctorPatientList[index]?.patient
                                ?.id ??
                            0, role: role, doctorID: doctorID,
                      );
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 15),
                  child: Container(
                    width: ScreenUtil().screenWidth * 0.83,
                    height: 170.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 0.3, // Border width
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.white],
                        // Adjust colors to match your design
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(25).r,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 165,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            "PATIENT DETAILS",
                                            style: GoogleFonts.nunito(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller
                                                    .assignedDoctorPatientList[
                                                        index]
                                                    ?.patient
                                                    ?.name
                                                    ?.toUpperCase() ??
                                                "",
                                            style: GoogleFonts.nunito(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller
                                                    .assignedDoctorPatientList[
                                                        index]
                                                    ?.patient
                                                    ?.patientId ??
                                                "Patient Id not generated",
                                            style: GoogleFonts.nunito(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return PatientDetails();
                                //   },
                                // ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colorutils.userdetailcolor,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.h, horizontal: 8.w),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 3, bottom: 3),
                                    child: Text(
                                      "View Details",
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                              height: 155.h,
                              child: CustomCircularProgressIndicator(0.5)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ):Center(
                child: const Text(
                  "No Patients Assingned",
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic),
                ),
              );
        }));
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final double percent;

  const CustomCircularProgressIndicator(this.percent, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getSeverityColor() {
      if (percent >= 0.7) {
        return Colors.red.shade500; // High severity
      } else if (percent >= 0.4) {
        return Colors.orange; // Medium severity
      } else {
        return Colors.green; // Low severity
      }
    }

    return SizedBox(
      width: 50,
      height: 50,
      child: CircularPercentIndicator(
        radius: 50.0,
        lineWidth: 22.0,
        percent: percent.clamp(0.0, 1.0),
        center: Text(
          "${(percent * 100).toStringAsFixed(0)}%",
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        progressColor: getSeverityColor(),
        backgroundColor: Colors.white,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
