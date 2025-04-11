import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_util.dart';
import 'Upcoming_List.dart';

class TabExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 25.h, left: 20.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PATIENT LIST ",
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
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorutils.userdetailcolor,
                    // gradient: LinearGradient(
                    //   colors: [Colors.green.shade100,Colors.blue.shade100], // Adjust colors to match your design
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      dividerColor: Colors.transparent, // Remove bottom line

                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorWeight: 0.0,
                      labelColor:Colors.blueGrey,
                      unselectedLabelColor: Colors.white,
                      labelStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(fontSize: 14),
                      tabs: const [
                        Tab(text: 'Upcoming'),
                        Tab(text: 'Past'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ExpandableCardList()  ,
                    ExpandableCardList()  ,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
