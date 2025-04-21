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
  final String name;
  final String role;
  final String token;

  const HomeScreenPatient(
      {super.key, required this.name, required this.role, required this.token});

  @override
  State<HomeScreenPatient> createState() => _HomeScreenPatientState();
}

class _HomeScreenPatientState extends State<HomeScreenPatient> {
  List<QuizSession> sessions = [
    QuizSession(
        title: "Next Session",
        time: "Tomorrow 2pm - 6pm",
        instructor: "Dr. Sara ben"),
    QuizSession(
        title: "Medication",
        time: "Improving",
        instructor: "7 day trend :Positive"),
    QuizSession(
        title: "Progress Score",
        time: "65% Complete",
        instructor: "Treatment plan"),
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
    final width = MediaQuery.of(context).size.width;

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
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Enquiry",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colorutils.userdetailcolor,
                      width: 0.3,
                    ),
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle('ENQUIRY NO: ', "ENQ-005"),
                        _buildTitle('ENQUIRY DATE: ', "18-4-2025"),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildTag("Ai report generated", Colorutils.userdetailcolor),
                            const SizedBox(width: 6),
                            _buildTag("On Progress", Colorutils.userdetailcolor),
                            const SizedBox(width: 6),
                            _buildTag("High", Colors.red),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
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
                  child: QuizList(sessions: sessions),
                ),
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

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.h),
            ),
            TextSpan(text: value,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.h)),
          ],
        ),
      ),
    );
  }
}
Widget _buildTag(String text, Color bgColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
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