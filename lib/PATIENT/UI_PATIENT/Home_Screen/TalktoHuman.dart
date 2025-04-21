import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../UI/Personal_Chat/Chat_Page.dart';

class TalkToHuman extends StatelessWidget {
  final List<Map<String, String>> chatData = [
    {
      "name": "Dr.thalhad",
      "message": "Chief Therapist",
      "avatar": "https://i.pravatar.cc/150?img=1"
    },
    {
      "name": "Dr.Vanthana",
      "message": "Junior therapist",
      "avatar": "https://i.pravatar.cc/150?img=2"
    },
    {
      "name": "Metromind Office",
      "message": "Office",
      "avatar": "https://i.pravatar.cc/150?img=3"
    },
    // Add more dummy chat data if needed
  ];

  TalkToHuman({super.key});
  Future<void> makePhoneCall() async {
    final Uri uri = Uri(scheme: 'tel', path: '7025402409');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: Text(
                "TALK TO HUMAN",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return Column(
                    children: [
                      GestureDetector(

                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(chat["avatar"]!),
                            radius: 25,
                          ),
                          title: Text(
                            chat["name"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(chat["message"]!),
                          trailing: GestureDetector(
                            child: SvgPicture.asset(
                              "assets/images/phone-call.svg",
                              width: 25.w,
                              height: 25.h,
                            ),

                          ),
                        ),
                        onTap: (){
                          print("----------------------calll");
                          makePhoneCall();
                        },
                      ),
                      Divider(
                        thickness: 0.3,
                        indent: 10, // aligns the divider with the text
                        endIndent: 10,
                      ),
                    ],
                  );
                  ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


