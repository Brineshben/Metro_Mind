import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/color_util.dart';
import '../Patient_Details/patient_details.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {},
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
                            padding: const EdgeInsets.only(top: 30, left: 10),
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
                                        "Arun Kumar R",
                                        style: GoogleFonts.nunito(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.h,
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
                                        "Anxiety Disorder",
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return PatientDetails();
                              },
                            ));
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
                          child: CustomCircularProgressIndicator(0.2)),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final double percent;

  CustomCircularProgressIndicator(this.percent);

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
        lineWidth: 25.0,
        percent: 0.45,
        center: Text(
          "84%",
          style: TextStyle(
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
