import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/color_util.dart';
import '../UI/Shedule_Page/shedule.dart';
import 'Junior_doctorView/Home_Junior.dart';


class PageIndexNavigationJunior extends StatefulWidget {
  const PageIndexNavigationJunior({
    Key? key,
  }) : super(key: key);

  @override
  State<PageIndexNavigationJunior> createState() =>
      _PageIndexNavigationJuniorState();
}

class _PageIndexNavigationJuniorState extends State<PageIndexNavigationJunior> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenJunior(),
      PatientSheduled(),
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
            ),
            BottomNavigationBarItem(
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
            ),

          ],
        ),
      ),
    );
  }
}

