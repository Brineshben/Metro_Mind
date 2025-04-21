import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/Constants.dart';
import '../../utils/color_util.dart';
import '../ChatScreen/Chat.dart';
import '../Common_Widget/appbar.dart';
import '../Personal_Chat/Chat_Page.dart';
import 'home_widgets/DashList.dart';
import 'home_widgets/course_List.dart';
import 'home_widgets/overallView.dart';
import 'home_widgets/patientList.dart';
import 'home_widgets/quiz_List.dart';

class HomeScreen extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  const HomeScreen({super.key, required this.role, required this.name, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                UserDetails(
                  isWelcome: true,
                  bellicon: true,
                  notificationcount: true,
                  name: '${widget.name} (${widget.role})',
                  image: 'assets/images/profile2.jpg',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.role.toUpperCase()} DASHBOARD",
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

                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Patient List',
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '4 Emergency',
                          style: GoogleFonts.shanti(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w900,
                            fontSize: 15.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CourseList(),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
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
                Tickets(ticketList: myTicketsList),
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
