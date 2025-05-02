import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/Constants.dart';
import '../../../../utils/color_util.dart';

import '../../../Controller/Patient_queue_Controller.dart';
import '../../../Controller/Quotes_Controller.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/patient_details.dart';
import '../../PATIENT/UI_PATIENT/Home_Screen/Activity.dart';
import '../../UI/Common_Widget/appbar.dart';
import '../../UI/HomePage/home_widgets/DashList.dart';
import '../../UI/HomePage/home_widgets/overallView.dart';
import '../bottom_Navigation_Chief.dart';
import 'DashChief.dart';



class HomeScreenChief extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  const HomeScreenChief({super.key, required this.role, required this.name, required this.token});


  @override
  State<HomeScreenChief> createState() => _HomeScreenChiefState();
}

class _HomeScreenChiefState extends State<HomeScreenChief> {

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
      "position": "ID:678",
      "image": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.rawpixel.com%2Fsearch%2Fpatient&psig=AOvVaw3wqk1nLkngaIv-l9vk_dqj&ust=1744276828034000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwjk6YjXz8qMAxWAQGwGHSPSKigQjRx6BAgAEBk"

    },
    {
      "name": "Priya",
      "position": "ID:679",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Mark Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "DrSOM",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Dr. Mark Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Dr. Mark Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Dr. Mark Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    },{
      "name": "Dr. Mark Johnson",
      "position": "ID:67",
      "image": "https://via.placeholder.com/150"
    },{
      "name": "Dr. Mark Johnson",
      "position": "ID:67",
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
                      if(controller.patientList.isEmpty) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 180),
                            child: Center(
                              child: const Text(
                                "Oops...No Data Found.",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic),
                              ),
                            ));
                      } else {
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        patientData?.name?.toUpperCase() ?? " ",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.h),
                                      ),
                                      Text(
                                        patientData?.email ?? " ",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.h),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${patientData?.patientId ?? "M-002"}",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 12.h),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colorutils.userdetailcolor,
                                          borderRadius:
                                          BorderRadius.circular(5),
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
                                            age: patientData?.age ?? 0,
                                            gender:
                                            patientData?.gender ?? " ",
                                            email:
                                            patientData?.email ?? " ",
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
                                            patientData?.patientId ??
                                                " ",
                                            token: widget.token,
                                            id: patientData?.id ?? 0,
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
                      }
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
                // GestureDetector(
                //   onTap: (){
                //     openWhatsAppChat(
                //       phoneNumber: '7010871411',
                //       message: 'Hello from Flutter!',
                //     );                  },
                //   child: ThoughtOfTheDayWidget(
                //     text:
                //     "Wherever the art of medicine is loved, there is also a love of humanity.",
                //     svgPath: "assets/images/Group.svg",
                //     onReadMore: () {
                //       print("Read More Clicked!");
                //     },
                //   ),
                // ),
                Obx(() {
                  final controller = Get.find<QuotesController>();
                  return ThoughtOfTheDayWidget(
                    text: controller.quotesData.value?.message?.quote ??
                        "Wherever the art of medicine is loved, there is also a love of humanity.",
                    svgPath: "assets/images/Group.svg",
                    onReadMore: () {
                      print("Read More Clicked!");
                    }, author: "-${controller.quotesData.value?.message?.author ?? "Brinesh ben"}",
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.h, left: 15.w, right: 10.w),
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
                  child:Dashchief( token: widget.token, emergency: true,),
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
