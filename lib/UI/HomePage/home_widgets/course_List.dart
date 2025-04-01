import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/color_util.dart';

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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(

                width: ScreenUtil().screenWidth * 0.83,
                height: 155.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12).r,
                    color: Colors.white),
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
                                        "PATIENT: Arun Kumar R",
                                        style: GoogleFonts.nunito(
                                          color:Colors.black,
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
                                        "AGE: 26",
                                        style: GoogleFonts.nunito(
                                          color:Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        "PATIENT ID:103B",
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
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
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colorutils.userdetailcolor,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 6.w),
                              // Make sure you're using `flutter_screenutil` for these.
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: Text(
                                  "View Details",
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    // Ensure ColorUtils is defined or use a custom color.
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10
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
                          child: CustomCircularProgressIndicator(0.87)),
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
        return Colors.red; // High severity
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
        percent: 0.7,
        // center: Text(
        //   "84%",
        //   style: TextStyle(
        //     fontSize: 13.0,
        //     fontWeight: FontWeight.bold,
        //     color: Colorutils.userdetailcolor,
        //   ),
        // ),
        progressColor:getSeverityColor(),
        backgroundColor: Colors.white,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
