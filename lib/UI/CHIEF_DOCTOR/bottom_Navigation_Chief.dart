import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_util.dart';

import '../Shedule_Page/shedule.dart';
import 'Ai_Engine/Ai_Engine_Page.dart';
import 'Settings/settings.dart';
import 'UI_CHIEF/Home_Chief.dart';

class PageIndexNavigationChief extends StatefulWidget {
  const PageIndexNavigationChief({
    Key? key,
  }) : super(key: key);

  @override
  State<PageIndexNavigationChief> createState() =>
      _PageIndexNavigationChiefState();
}

class _PageIndexNavigationChiefState extends State<PageIndexNavigationChief> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenChief(),
      TabExample(),
      AiEngine(
        sessions: [
          SessionModel(title: "AI Summarizer", Count: "5", time: "Generate a clinical summary based on symptoms and history", emergency: true),
          SessionModel(title: "Diagnosis Assistant", Count: "5", time: "Suggest a diagnosis based on patient data and input", emergency: true),
          SessionModel(title: "Protocol Generator", Count: "5", time: "Recommend a treatment plan based on the diagnosis", emergency: true),
          SessionModel(title: "Outcome Predictor", Count: "5", time: "Predict therapy response and recommend adjustments", emergency: true),
        ],
      ),
      ProfileSettingsPage()
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
                "assets/images/house-bottom.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Overview',
            ), BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/patient.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'PatientList',
            ), BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/AI.svg",
                width: 28.w,
                height: 28.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'AI Engine',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/chat_outline.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Tele Communication',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/settings-svgrepo-com.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Settings',
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
