import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_util.dart';

class ExpandableCardList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'name': 'Roy',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in UI/UX and API integration'
    },
    {
      'name': 'Jane Smith',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Expert in Node.js, Python, and Databases'
    },
    {
      'name': 'Alice Brown',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in Flutter and React Native'
    },
    {
      'name': 'Alice Brown',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in Flutter and React Native'
    },
    {
      'name': 'Alice Brown',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in Flutter and React Native'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 25.h, bottom: 0.h, left: 20.w, right: 10.w),
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 1),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide.none),
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide.none),
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(0.1),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/profile2.jpg",
                                fit: BoxFit.cover,
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("PATIENT: ",
                                        style: TextStyle(
                                            fontSize: 15.h,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueGrey)),
                                    Text(items[index]['name']!,
                                        style: TextStyle(
                                            fontSize: 15.h,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueGrey)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("APPOINMENT DATE: ",
                                        style: TextStyle(
                                            fontSize: 13.h,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueGrey)),
                                    Text("30-08-2025",
                                        style: TextStyle(
                                            fontSize: 13.h,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueGrey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colorutils.userdetailcolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("AI SUMMARY",
                                  style: TextStyle(
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.blueGrey)),
                              SizedBox(height: 10),
                              Text(
                                "John Doe, a 34-year-old male, was admitted on March 14, 2025, with symptoms of schizoaffective disorder, bipolar type. He exhibited erratic behavior, hallucinations, and mood swings ranging from mania to depression. His mental status showed disorganized thoughts, poor judgment, and impaired insight. He has a psychiatric history dating back to age 27 and limited social support. The treatment plan includes antipsychotic and mood stabilizer medications, CBT, group therapy, and social support services. Prognosis is guarded, with ongoing monitoring and therapy recommended.",
                                style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("SESSION: 3:00PM- 4:00PM",
                                      style: TextStyle(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.green)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
