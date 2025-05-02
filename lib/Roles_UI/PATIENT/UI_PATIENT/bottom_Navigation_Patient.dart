import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../Controller/Quotes_Controller.dart';
import '../../../utils/color_util.dart';
import '../../UI/ChatScreen/Chat.dart';
import '../../UI/Shedule_Page/shedule.dart';
import 'Assesment/Assesment.dart';
import 'Assesment/MyAssesmentLIst.dart';
import 'Chat_Patient/Chat_PAtient.dart';
import 'Home_Screen/Home_Screen_Patient.dart';
import 'Home_Screen/TalktoHuman.dart';

class PageIndexNavigationPatient extends StatefulWidget {
  final String role;
  final int userid;
  final String name;
  final String date;
  final String patientId;
  final String tokenPatient;
  const PageIndexNavigationPatient({Key? key, required this.tokenPatient, required this.role, required this.name, required this.date, required this.patientId, required this.userid}) : super(key: key);

  @override
  State<PageIndexNavigationPatient> createState() =>
      _PageIndexNavigationPatientState();
}

class _PageIndexNavigationPatientState
    extends State<PageIndexNavigationPatient>  with SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
    Get.find<QuotesController>().QuotesData(widget.tokenPatient);

    _screens = [
      HomeScreenPatient(name:widget.name, role: widget.role, token: widget.tokenPatient, date: widget.date, patientId: widget.patientId,),
      TalkToHuman(),
      MyAssesmentListPage(token:  widget.tokenPatient, id: widget.userid)
    ];

  }

  @override
  void dispose() {
    super.dispose();
  }
  int _selectedIndex = 0;
  late final List<Widget> _screens;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      floatingActionButton: GestureDetector(
        onDoubleTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) { return
          //   ChatScreen(patientToken:widget.tokenPatient,);
          //
          // },));
        },
        child: Card(
          color: Colors.white,

          elevation: 4,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(40), // circular for round shape
          ),
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Lottie.asset(
              "assets/images/Splash ScreenLQ.json",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),      bottomNavigationBar: SizedBox(
        height: 67.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colorutils.userdetailcolor,
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/patient.svg",
                      width: 25.w,
                      height: 25.h,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 0
                            ? Colorutils.userdetailcolor
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Overview',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: SvgPicture.asset(
                  //     "",
                  //     width: 25.w,
                  //     height: 25.h,
                  //     colorFilter: ColorFilter.mode(
                  //       _selectedIndex == 1
                  //           ? Colorutils.userdetailcolor
                  //           : Colors.grey,
                  //       BlendMode.srcIn,
                  //     ),
                  //   ),
                  //   label: 'Metromind Ai',
                  // ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/phone-call.svg",
                      width: 25.w,
                      height: 25.h,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 1
                            ? Colorutils.userdetailcolor
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Talk to Human',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/memo-pad.svg",
                      width: 25.w,
                      height: 25.h,
                      color: Colors.grey,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 2 ? Colorutils.userdetailcolor : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Assessments',

                  )
                ],
              ),
            ),
            // Positioned(
            //   top: -25.h,
            //   left: 0,
            //   right: 0,
            //   child: ScaleTransition(
            //     scale: _scaleAnimation,
            //     child: Center(
            //       child: GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _selectedIndex = 1;
            //           });
            //         },
            //         child: CircleAvatar(
            //           radius: 31.r,
            //           backgroundColor: Colorutils.userdetailcolor,
            //
            //           child: CircleAvatar(
            //             radius: 30.r,
            //             backgroundColor: _selectedIndex == 1
            //                 ? Colors.white
            //                 : Colorutils.userdetailcolor,
            //
            //             child: CircleAvatar(
            //               backgroundColor: Colorutils.userdetailcolor,
            //               radius: 28.r,
            //               child:SvgPicture.asset(
            //                 "assets/images/AI.svg",
            //                 width: 30.w,
            //                 height: 30.h,
            //                 colorFilter: ColorFilter.mode(
            //                   _selectedIndex == 1
            //                       ? Colors.white
            //                       : Colors.white,
            //                   BlendMode.srcIn,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
