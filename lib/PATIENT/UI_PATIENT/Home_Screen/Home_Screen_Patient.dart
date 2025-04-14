import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/Constants.dart';
import '../../../../utils/color_util.dart';


import '../../../UI/Common_Widget/appbar.dart';
import '../../../UI/HomePage/home_widgets/DashList.dart';
import '../../../UI/HomePage/home_widgets/overallView.dart';
import '../../../UI/HomePage/home_widgets/quiz_List.dart';
import 'Activity.dart';


class HomeScreenPatient extends StatefulWidget {
  const HomeScreenPatient({super.key});


  @override
  State<HomeScreenPatient> createState() => _HomeScreenPatientState();
}

class _HomeScreenPatientState extends State<HomeScreenPatient> {
  List<QuizSession> sessions = [
    QuizSession(title: "Next Session", time: "Tomorrow 2pm - 6pm", instructor: "Dr. Sara ben"),
    QuizSession(title: "Medication", time: "Improving", instructor: "7 day trend :Positive"),
    QuizSession(title: "Progress Score", time: "65% Complete", instructor: "Treatment plan"),
  ];
  List<TicketsData> myTicketsList = [
    TicketsData(name: "Total Patients", number: "1"),
    TicketsData(name: "Today Sessions", number: "2"),
    TicketsData(name: "All Insights", number: "30"),
    TicketsData(name: "Pending Reviews", number: "5"),
  ];
  List<AttendanceData> myAttendanceList = [
    AttendanceData(
        name: "5",
        designation: "KAv",
        category: "Total Patients",
        icon: Icons.person,
        data: '+4 this Month'),
    AttendanceData(
        name: "3",
        designation: "Prof",
        category: "Today Sessions",
        icon: Icons.calendar_month_outlined,
        data: 'Next:Brinesh (2pm)'),
    AttendanceData(
        name: "10",
        designation: "Eng",
        category: "All Insights",
        icon: Icons.circle_outlined,
        data: 'Across 2 patients'),
    AttendanceData(
        name: "5",
        designation: "Dr.",
        category: "Pending Reviews",
        icon: Icons.nature,
        data: 'Treatment plan needing review'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Colors.green, Colors.white], // Define your colors
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const UserDetails(
                  isWelcome: true,
                  bellicon: true,
                  notificationcount: true,
                  name: 'Arun  [Patient]',
                  image: 'assets/images/profile2.jpg',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Patient Dashboard",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
                ThoughtOfTheDayWidget(
                  text:
                  "Wherever the art of medicine is loved, there is also a love of humanity.",
                  svgPath: "assets/images/Group.svg",
                  onReadMore: () {
                    print("Read More Clicked!");
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Summary",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:QuizList(sessions: sessions),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Column(
                //           children: [
                //             Container(
                //               padding: const EdgeInsets.all(12),
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   color: Colorutils.userdetailcolor,
                //                   width: 0.5,
                //                 ),
                //                 gradient: LinearGradient(
                //                   colors: [Colors.teal.shade50, Colors.white],
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                 ),
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text('NEXT STEP',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.blueGrey)),
                //                   const SizedBox(height: 5),
                //
                //                   Text('Next step in journey, initial assesment pending',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           color: Colors.blueGrey)),
                //
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(height: 12),
                //             Container(
                //               padding: const EdgeInsets.all(12),
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   color: Colorutils.userdetailcolor,
                //                   width: 0.5,
                //                 ),
                //                 gradient: LinearGradient(
                //                   colors: [Colors.teal.shade50, Colors.white],
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                 ),
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               child:Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //
                //                 children: [
                //                   Text('Flagged Alerts',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.blueGrey)),
                //                   const SizedBox(height: 5),
                //
                //                   Text('-Mental Disorder',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           color: Colors.blueGrey)),
                //                   Text('-Generalise Anxiety Disorder',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           color: Colors.blueGrey)),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(width: 5),
                //
                //       Expanded(
                //         child: Container(
                //           padding: const EdgeInsets.all(2),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Colorutils.userdetailcolor,
                //               width: 0.5,
                //             ),
                //             gradient: LinearGradient(
                //               colors: [Colors.teal.shade50, Colors.white],
                //               begin: Alignment.topCenter,
                //               end: Alignment.bottomCenter,
                //             ),
                //             borderRadius: BorderRadius.circular(12),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Column(
                //               crossAxisAlignment:
                //               CrossAxisAlignment.start,
                //               children: const [
                //                 Text('Diagnosis Suggestion',
                //                     style: TextStyle(
                //                         fontSize: 15,
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.blueGrey)),
                //                 SizedBox(height: 8),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Major Depressive Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Mental Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),   Text('-Mental Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),   Text('-Mental Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),   Text('-Mental Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),   Text('-Mental Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //                 Text('-Generalise Anxiety Disorder',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.blueGrey)),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(width: 5),
                //
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 1.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Activity",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colorutils.userdetailcolor.withOpacity(0.1),
                  border: Border.all(
                    color: Colorutils.userdetailcolor,
                    width: 1.w,
                  ),
                ),
                width: double.infinity,
                height: 250.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      SizedBox(height: 10),
                      RecentActivityTile(
                        title: "Completed mood assessment",
                        subtitle: "Yesterday at 4:30 PM",
                      ),
                      RecentActivityTile(
                        title: "Therapy session with Dr. Johnson",
                        subtitle: "Monday at 2:00 PM",
                      ),
                      RecentActivityTile(
                        title: "Updated treatment goals",
                        subtitle: "Last week",
                      ),
                    ],
                  ),
                ),
              ),
            ),

              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => ChatScreenDoctor()));
        //   },
        //   backgroundColor: Colors.white,
        //   child: SvgPicture.asset(
        //     'assets/images/chat_outline.svg', // Replace with your SVG path
        //     width: 30, // Adjust size as needed
        //     height: 30,
        //   ),
        // ),
      ),
    );
  }
}
