import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color_util.dart';
import '../../UI/Shedule_Page/shedule.dart';
import 'Assesment/Assesment.dart';
import 'Chat_Patient/Chat_PAtient.dart';
import 'Home_Screen/Home_Screen_Patient.dart';

class PageIndexNavigationPatient extends StatefulWidget {
  const PageIndexNavigationPatient({Key? key}) : super(key: key);

  @override
  State<PageIndexNavigationPatient> createState() =>
      _PageIndexNavigationPatientState();
}

class _PageIndexNavigationPatientState
    extends State<PageIndexNavigationPatient>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenPatient(),
      PatientSheduled(),
      AssessmentListPage(),
      ChatListPage(),
    ];
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  int _selectedIndex = 0;
  late final List<Widget> _screens;

/*  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenPatient(),
      PatientSheduled(),
      AssessmentListPage(),
      ChatListPage(),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
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
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "",
                      width: 25.w,
                      height: 25.h,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 1
                            ? Colorutils.userdetailcolor
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Metromind Ai',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/phone-call.svg",
                      width: 25.w,
                      height: 25.h,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 2
                            ? Colorutils.userdetailcolor
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Talk to Human',
                  ),
                ],
              ),
            ),
            Positioned(
              top: -25.h,
              left: 0,
              right: 0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Center(
                  child: CircleAvatar(
                    radius: 31.r,
                    backgroundColor: Colorutils.userdetailcolor,

                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: _selectedIndex == 1
                          ? Colors.white
                          : Colorutils.userdetailcolor,

                      child: CircleAvatar(
                        backgroundColor: Colorutils.userdetailcolor,
                        radius: 28.r,
                        child:SvgPicture.asset(
                          "assets/images/AI.svg",
                          width: 30.w,
                          height: 30.h,
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 1
                                ? Colors.white
                                : Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
