import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Controller/Doctor_List_Controller.dart';
import '../../../../utils/Constants.dart';
import '../../../../utils/color_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../CHIEF_DOCTOR/Chiefdoctor_View/DashChief.dart';
import '../../Controller/Patient_queue_Controller.dart';
import '../../UI/Common_Widget/appbar.dart';
import '../../UI/HomePage/Patient_Details/patient_details.dart';
import '../../UI/HomePage/home_widgets/DashList.dart';
import '../../UI/HomePage/home_widgets/overallView.dart';
import 'package:get/get.dart';

class HomeScreenJunior extends StatefulWidget {
  final String name;
  final String role;
  final String token;

  const HomeScreenJunior(
      {super.key, required this.name, required this.role, required this.token});

  @override
  State<HomeScreenJunior> createState() => _HomeScreenJuniorState();
}

class _HomeScreenJuniorState extends State<HomeScreenJunior> {
  @override
  // void initState() {
  //   Get.find<PatientQueueController>().patientData(widget.token);
  //   super.initState();
  // }

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
                      'Patient Queue List'.toUpperCase(),
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.h,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GetX<PatientQueueController>(
                    builder: (PatientQueueController controller) {
                      return ListView.builder(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // Prevent nested scroll conflict
                        itemCount: controller.patientList.length,
                        itemBuilder: (context, index) {
                          final patientData = controller.patientList[index];
                          return Column(
                            children: [
                              ListTile(
                                leading: ClipOval(
                                  child: Image.asset(
                                    "assets/images/profileimage.jpg",
                                    fit: BoxFit.cover,
                                    width: 40.w,
                                    height: 45.w,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patientData?.name?.toUpperCase() ?? " ",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.h),
                                    ),
                                    Text(
                                      "${patientData?.patientId ?? "M-002"}",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 12.h),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      patientData?.email ?? " ",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.h),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colorutils.userdetailcolor,
                                        borderRadius: BorderRadius.circular(5),
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
                                        builder: (context) => PatientDetails(
                                              name: patientData?.name ?? " ",
                                              age: patientData?.age ?? " ",
                                              gender:
                                                  patientData?.gender ?? " ",
                                              email: patientData?.email ?? " ",
                                              phone:
                                                  patientData?.mobileNumber ??
                                                      " ",
                                              disease: " ",
                                              severity: patientData
                                                      ?.diagnosis?.severity ??
                                                  " ",
                                              diagnosissummary: patientData
                                                      ?.diagnosis
                                                      ?.diagnosisSummary ??
                                                  "No AI Summary Report",
                                              patientId:
                                                  patientData?.patientId ?? " ", token:  widget.token,
                                            )),
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
                UserDetails(
                  isWelcome: true,
                  bellicon: true,
                  notificationcount: true,
                  name: '${widget.name} (${widget.role})',
                  image: 'assets/images/profile2.jpg',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.h, bottom: 25.h, left: 18.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.role.toUpperCase()} DASHBOARD",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
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
                        "SUMMARY",
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
                  child: Dashchief(
                    sessions: sessions,
                    token: widget.token,
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
