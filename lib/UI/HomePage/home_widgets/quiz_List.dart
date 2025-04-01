import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_util.dart';

class QuizList extends StatefulWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  bool isSwitched = false; // Initial state of the switch

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {


          return GestureDetector(
            onTap: (){
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25).r,
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 3, bottom: 4, left: 6, right: 4),
              width: 140.w,
              height: 160.w,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 13, bottom: 13, right: 6).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Mr.Yadav",
                            style: GoogleFonts.nunito(
                              color: Colors.black, // Ensure ColorUtils is defined or use a custom color.
                              fontWeight: FontWeight.w600,
                              fontSize: 12.h,  // Ensure you're using flutter_screenutil to define font size responsively.
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Text(
                              "Anxiety Disorder".toUpperCase(),
                              style: GoogleFonts.nunito(
                                color: Colors.black, // Ensure ColorUtils is defined or use a custom color.
                                fontWeight: FontWeight.w600,
                                fontSize: 10.h,  // Ensure you're using flutter_screenutil to define font size responsively.
                              ),
                            )
                          ],
                        ),  Row(
                          children: [
                            Text(
                              "Appolo hospital chennai",
                              style: GoogleFonts.nunito(
                                color: Colors.black, // Ensure ColorUtils is defined or use a custom color.
                                fontWeight: FontWeight.w600,
                                fontSize: 10.h,  // Ensure you're using flutter_screenutil to define font size responsively.
                              ),
                            )
                          ],
                        ),
                        // Text(
                        //   "30 Questions",
                        //   style: GoogleFonts.nunito(
                        //     color: Colors.grey, // Ensure ColorUtils is defined or use a custom color.
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 8.h,  // Ensure you're using flutter_screenutil to define font size responsively.
                        //   ),
                        // ),
                         Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched; // Toggle the state on tap
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 100, // Width of the switch container
                  height: 30, // Height of the switch container
                  decoration: BoxDecoration(
                    color: isSwitched ? Colorutils.progress2 : Colorutils.maincolor, // Background changes based on state
                    borderRadius: BorderRadius.circular(19), // Rounded corners
                  ),
                  child: Stack(
                    children: [
                      // Switch Button Text
                      Align(
                        alignment: isSwitched ? Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(""),
                        ),
                      ),
                      // Circular Button that moves
                      Align(
                        alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 50,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19),
                             
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // Shadow for button
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(child: Text("Active",style: TextStyle(fontSize: 8,color: Colorutils.primaryColor1),)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                         Spacer(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
