import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Controller/JuniorDashoard_Controller.dart';
import '../../Controller/Quotes_Controller.dart';
import '../../Controller/SheduleController.dart';
import '../../utils/color_util.dart';
import '../UI/Medicine/Medicine.dart';
import '../UI/Shedule_Page/Upcoming_List.dart';
import '../UI/Shedule_Page/shedule.dart';
import 'Ai_Engine/Ai_Engine_Page.dart';
import 'Chiefdoctor_View/Home_Chief.dart';
import 'Settings/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class PageIndexNavigationChief extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  const PageIndexNavigationChief({
    Key? key, required this.role, required this.name, required this.token,
  }) : super(key: key);

  @override
  State<PageIndexNavigationChief> createState() =>
      _PageIndexNavigationChiefState();
}

class _PageIndexNavigationChiefState extends State<PageIndexNavigationChief> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    Get.find<ScheduleController>().scheduleDataz(widget.token);
    Get.find<QuotesController>().QuotesData(widget.token);
    Get.find<JuniorDashboardController>().juniorData(widget.token);

    _screens = [
      HomeScreenChief(role:widget.role, name: widget.name, token: widget.token,),
      PatientExpandableCardList(),
      AiEngine(
        sessions: [
          SessionModel(
              title: "AI Summarizer",
              Count: "5",
              time: "Generate a clinical summary based on symptoms and history",
              emergency: true),
          SessionModel(
              title: "Diagnosis Assistant",
              Count: "5",
              time: "Suggest a diagnosis based on patient data and input",
              emergency: true),
          SessionModel(
              title: "Protocol Generator",
              Count: "5",
              time: "Recommend a treatment plan based on the diagnosis",
              emergency: true),
          SessionModel(
              title: "Outcome Predictor",
              Count: "5",
              time: "Predict therapy response and recommend adjustments",
              emergency: true),
        ],
      ),
      ProfileSettingsPage(),
      // Medicine()
    ];

  }

  @override
  void dispose() {
    _controller.dispose();
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
                    label: 'Doctor List',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/settings-svgrepo-com.svg",
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
                    label: 'Settings',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/chat_outline.svg",
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
                    label: 'Tele Communication',
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

Future<void> openWhatsAppChat({
  required String phoneNumber,
  String message = 'weloasnd wjdhe ',
}) async {
  final encodedMessage = Uri.encodeComponent(message);
  final url = 'https://wa.me/$phoneNumber?text=$encodedMessage';

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch WhatsApp chat';
  }
}
