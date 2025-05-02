import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient/Controller/Slot_Controller.dart';
import '../../Controller/Doctor_List_Controller.dart';
import '../../Controller/JuniorDashoard_Controller.dart';
import '../../Controller/Patient_queue_Controller.dart';
import '../../Controller/Quotes_Controller.dart';
import '../../Controller/SheduleController.dart';
import '../../utils/color_util.dart';
import '../UI/Shedule_Page/shedule.dart';
import 'Junior_doctorView/Doctor_List.dart';
import 'Junior_doctorView/Home_Junior.dart';
import 'package:get/get.dart';

class PageIndexNavigationJunior extends StatefulWidget {
  final String role;
  final String name;
  final String token;

  const PageIndexNavigationJunior({
    Key? key,
    required this.role,
    required this.name,
    required this.token,
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

    Get.find<PatientQueueController>().patientData(widget.token);
    Get.find<SlotController>().SlotListData(widget.token);
    Get.find<DoctorListController>().doctorListData(widget.token);
    Get.find<ScheduleController>().scheduleDataz(widget.token);
    Get.find<QuotesController>().QuotesData(widget.token);
    Get.find<JuniorDashboardController>().juniorData(widget.token);

    _screens = [
      HomeScreenJunior(
        name: widget.name,
        role: widget.role,
        token: widget.token,
      ),
      PatientSheduled(),
      DoctorList(token: widget.token)
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
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/stethoscope.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'DoctorList',
            ),
          ],
        ),
      ),
    );
  }
}
