import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/Constants.dart';
import '../../../../utils/color_util.dart';

import '../../CHIEF_DOCTOR/Chiefdoctor_View/DashChief.dart';
import '../../PATIENT/UI_PATIENT/Home_Screen/Activity.dart';
import '../../UI/Common_Widget/appbar.dart';
import '../../UI/HomePage/Patient_Details/patient_details.dart';
import '../../UI/HomePage/home_widgets/DashList.dart';
import '../../UI/HomePage/home_widgets/overallView.dart';

class HomeScreenJunior extends StatefulWidget {
  const HomeScreenJunior({super.key});

  @override
  State<HomeScreenJunior> createState() => _HomeScreenJuniorState();
}

class _HomeScreenJuniorState extends State<HomeScreenJunior> {
  List<DashboardSessions> sessions = [
    DashboardSessions(
        title: "Patient Sevierity",
        time: "+48 this month",
        instructor: "Dr. Sara ben",
        Count: '10',
        emergency: true),
    DashboardSessions(
        title: "Active Therapist",
        time: "All India",
        instructor: "7 day trend :Positive",
        Count: '32',
        emergency: false),
    DashboardSessions(
        title: "Monthly Sessions",
        time: "+12% this month",
        instructor: "Treatment plan",
        Count: '1900',
        emergency: false),
    DashboardSessions(
        title: "System Usage",
        time: "2 New",
        instructor: "Home Work",
        Count: '10',
        emergency: false),
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
  final List<Map<String, String>> doctors = [
    {
      "name": "Arun",
      "position": "M-67876467",
      "image":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.rawpixel.com%2Fsearch%2Fpatient&psig=AOvVaw3wqk1nLkngaIv-l9vk_dqj&ust=1744276828034000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwjk6YjXz8qMAxWAQGwGHSPSKigQjRx6BAgAEBk"
    },
    {
      "name": "Priya",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "DrSOM",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "M-67876467",
      "image": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buildDoctorDrawer(BuildContext context) {
      return Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
        ),
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: Text(
                      'Patient Queue',
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // Prevent nested scroll conflict
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return Column(
                        children: [
                          ListTile(
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
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor["name"]!,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.h),
                                ),
                                Text(
                                  "Re-Visit",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.h),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  doctor["position"]!,
                                  style:  TextStyle(
                                      color: Colors.blueGrey, fontSize: 12.h),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colorutils.userdetailcolor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'AI Summary',
                                    style: GoogleFonts.shanti(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDetails()),
                              );
                            },
                          ),
                          Divider(
                            thickness: 1,
                            height: 0,
                            indent: 5,
                            endIndent: 5,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: _buildDoctorDrawer(context),
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
                  name: 'Dr.Arya [Junior Therapist]',
                  image: 'assets/images/profile2.jpg',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Junior Therapist Dashboard",
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
                  padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 10.w),
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
                  child: Dashchief(sessions: sessions),
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
