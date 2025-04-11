import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_util.dart';
import '../../HomePage/Patient_Details/patient_details.dart';
class DashboardSessions {
  final bool emergency;
  final String title;
  final String Count;
  final String time;
  final String instructor;

  DashboardSessions({
    required this.emergency,
    required this.title,
    required this.Count,
    required this.time,
    required this.instructor,
  });
}
class Dashchief extends StatefulWidget {

  final List<DashboardSessions> sessions;

  const Dashchief({Key? key, required this.sessions}) : super(key: key);

  @override
  State<Dashchief> createState() => _DashchiefState();
}

class _DashchiefState extends State<Dashchief> {
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
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10).w,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1.2, // Adjust for width/height ratio
      ),
      itemCount: widget.sessions.length,
      itemBuilder: (context, index) {
        final session = widget.sessions[index];
        return GestureDetector(
          onTap: () {
            // Handle tap
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25).r,
              border: Border.all(
                color: Colorutils.userdetailcolor,
                width: 0.3,
              ),
              gradient: LinearGradient(
                colors: [Colors.teal.shade50, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(10).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  session.title.toUpperCase(),
                  style: GoogleFonts.nunito(
                    color: Colorutils.userdetailcolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.h,
                  ),
                ),
                Text(
                  session.Count,
                  style: GoogleFonts.nunito(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.h,
                  ),
                ),
                Text(
                  "[${session.time}]",
                  style: GoogleFonts.nunito(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 13.h,
                  ),
                ),
                session.emergency?  GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openDrawer();

                    // _showDoctorBottomSheet(context);
                  },
                  child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '4 Emergency',
                        style: GoogleFonts.shanti(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w900,
                          fontSize: 15.h,
                        ),
                      ),
                    ),
                ):SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
