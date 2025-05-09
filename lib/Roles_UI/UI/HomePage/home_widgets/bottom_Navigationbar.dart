// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../AppintmentsPage/Appointments.dart';
// import '../home_screen.dart';
//
// class PageIndexNavigation extends StatefulWidget {
//   const PageIndexNavigation({Key? key}) : super(key: key);
//
//   @override
//   State<PageIndexNavigation> createState() =>
//       _PageIndexNavigationState();
// }
//
// class _PageIndexNavigationState extends State<PageIndexNavigation> {
//   int _selectedIndex = 0;
//   final List<Widget> _screens = [
//     HomeScreen(),
//     AppointmentsScreen(),
//     HomeScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Colors.white ,
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: Padding(
//
//         padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//
//         child: Container(
//
//             height: 70.w,
//             child: BottomNavigationBar(
//               unselectedItemColor: Colors.grey,
//
//
//               backgroundColor: Colors.blue,
//
//               type: BottomNavigationBarType.fixed,
//               items: <BottomNavigationBarItem>[
//
//                 BottomNavigationBarItem(
//
//
//                   icon: SvgPicture.asset(
//                     'assets/images/Selectedhome.svg',
//                     height: 25,
//                     width: 25,
//
//                   ),
//                   label: 'HOME',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     'assets/images/Selectedwishlist.svg',
//                     height: 25,
//                     width: 25,
//
//                   ),
//                   label: 'APPOINTMENTS',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     'assets/images/SelectedProfile.svg',
//                     height: 25,
//                     width: 20,
//
//                   ),
//                   label: 'PROFILE',
//                 ),
//
//               ],
//               currentIndex: _selectedIndex,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//
//               selectedItemColor: Colors.white,  // Change the color for selected item
//             )// Call the function to update the index and navigate
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient/utils/color_util.dart';

import '../../../../Controller/SheduleController.dart';
import '../../../PATIENT/UI_PATIENT/Chat_Patient/Chat_PAtient.dart';
import '../../AppintmentsPage/Appointments.dart';

import '../../Assesment_therapist/Assesment_Page.dart';
import '../../Shedule_Page/shedule.dart';
import '../home_screen.dart';

class PageIndexNavigationTherapist extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  final int doctorId;
  const PageIndexNavigationTherapist({
    Key? key, required this.role, required this.name, required this.token, required this.doctorId,
  }) : super(key: key);

  @override
  State<PageIndexNavigationTherapist> createState() => _PageIndexNavigationTherapistState();
}

class _PageIndexNavigationTherapistState extends State<PageIndexNavigationTherapist> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    Get.find<ScheduleController>().scheduleDataz(widget.token);

    _screens = [
      HomeScreen(role: widget.role, name: widget.name, token: widget.token, doctorId: widget.doctorId,),
      PatientSheduled(),
      AssesmentPage(),

      ChatListPage()

      // ChatScreen(),
      // UserProfileScreen(
      //   name: 'Dr: Brinesh',
      //   userType: 'Chief Surgeon',
      //   profilePicture: '',
      //   Email: 'brineshben@gmail.con',
      //   phone: 7010871411,
      // ),
      // HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 75.h,
        child: BottomNavigationBar(
          backgroundColor:Colors.white,
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
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? Colorutils.userdetailcolor : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Patients',

            ),BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/time-check.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? Colorutils.userdetailcolor : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Schedule',

            ),BottomNavigationBarItem(
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

            ),BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/chat_outline.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3 ?Colorutils.userdetailcolor : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Chat',

            ),

          ],
        ),
      ),
    );
  }
}
// BottomNavigationBar(
// unselectedItemColor: Colors.blueGrey,
// unselectedIconTheme: IconThemeData(color: Colors.blueGrey),
// // Unselected icon color
// iconSize: 5,
// elevation: 0,
//
//
// backgroundColor: Colorutils.userdetailcolor,
//
// type: BottomNavigationBarType.fixed,
// items: <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/Selectedhome.svg',
//
// height: 20,
// width: 20,
// ),
// label: 'HOME',
//
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/Selectedwishlist.svg',
// height: 20,
// width: 20,
// ),
// label: 'APPOINTMENTS',
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/SelectedProfile.svg',
// height: 20,
// width: 20,
// ),
// label: 'PROFILE',
// ),
// ],
// currentIndex: _selectedIndex,
// onTap: (index) {
// setState(() {
// _selectedIndex = index;
// });
// },
// //
// selectedItemColor:
// Colors.white, // Change the color for selected item
// )
