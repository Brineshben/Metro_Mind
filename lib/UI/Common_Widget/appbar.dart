import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../utils/color_util.dart';
import '../Task_Scree.dart';


// class UserDetails extends StatelessWidget {
//   final String name;
//   final String image;
//
//   final bool isWelcome;
//   final bool bellicon;
//   final bool notificationcount;
//
//   const UserDetails({
//     super.key,
//     required this.isWelcome,
//     required this.bellicon,
//     required this.notificationcount,
//     required this.name,
//     required this.image,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130.h,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colorutils.userdetailcolor, Colorutils.primaryColor2, // End color Colorutils.userdetailcolor, // End color
//              // End color
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),              borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(20),
//         bottomRight: Radius.circular(20),
//       ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 30),
//         child: Row(
//           children: [
//             SizedBox(width: 12.w),
//             // GestureDetector(
//             //   onTap: () {
//             //
//             //   },
//             //   child: Container(
//             //     height: 50.h,
//             //     width: 50.h,
//             //     padding: EdgeInsets.symmetric(horizontal: 9.h),
//             //     decoration: BoxDecoration(
//             //       color: Colors.white.withOpacity(0.1),
//             //       borderRadius: BorderRadius.circular(8.r),
//             //     ),
//             //     child: SvgPicture.asset(
//             //       "assets/images/menu_icon.svg",
//             //       fit: BoxFit.contain,
//             //     ),
//             //   ),
//             // ),
//
//             SizedBox(width: 2.w),
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 25.r,
//               child: CircleAvatar(
//                 radius: 24.r,
//                 backgroundImage: CachedNetworkImageProvider(
//                     "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0="),
//                 backgroundColor: Colors.white,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle error (optional)
//                 },
//               ),
//             ),
//             SizedBox(width: 12.w),
//
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     isWelcome ? 'Welcome!' : 'Hello,',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12.h,
//                       color: Colors.white.withOpacity(0.7),
//                     ),
//                   ),
//                   Container(
//                     child: TextScroll(
//                        'Brinesh ben [SENIOR CHIEF SURGEON]',
//                       mode: TextScrollMode.bouncing,
//                       velocity:
//                       const Velocity(pixelsPerSecond: Offset(50, 0)),
//                       delayBefore: const Duration(seconds: 1),
//                       pauseBetween: const Duration(seconds: 2),
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.h,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                       selectable: true,
//                     ),
//                   ),
//
//                   // TextScroll(
//                   //   'This is the sample text for Flutter TextScroll widget. ',
//                   //   mode: TextScrollMode.bouncing,
//                   //   velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
//                   //   delayBefore: Duration(milliseconds: 500),
//                   //   numberOfReps: 5,
//                   //   pauseBetween: Duration(milliseconds: 50),
//                   //   style: TextStyle(color: Colors.green),
//                   //   textAlign: TextAlign.right,
//                   //   selectable: true,
//                   // )
//                   // SingleChildScrollView(
//                   //   scrollDirection: Axis.horizontal,
//                   //   child: Row(
//                   //     children: [
//                   //       Text(
//                   //         controller.userData.value.name ?? "--",
//                   //         style: TeacherAppFonts.interW600_18sp_textWhite,
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 12.w),
//             if (bellicon)
//               GestureDetector(
//                 onTap: () {},
//                 child: Stack(
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.only(right: 5.w, top: 5.h),
//                         child: bellicon
//                             ? SvgPicture.asset(
//                           'assets/images/bell 1.svg',
//                           color: Colors.white,
//                           width: 28.h,
//                           fit: BoxFit.fitWidth,
//                         )
//                             : const Text("")),
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                         width: 15.h,
//                         height: 15.h,
//                         padding: const EdgeInsets.all(2).w,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: FittedBox(
//                           child: Text(
//                             "0",
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 10.h,
//                               color: Colorutils.userdetailcolor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             SizedBox(width: 12.w),
//
//
//             // CircleAvatar(
//             //   radius: 26.r,
//             //   child: CircleAvatar(
//             //     radius: 25.r,
//             //     child: ClipRRect(
//             //       borderRadius: BorderRadius.circular(100).r,
//             //       child: CachedNetworkImage(
//             //         imageUrl:
//             //         "https://media.istockphoto.com/id/1029035836/photo/ai-robot-thinking.jpg?s=612x612&w=0&k=20&c=Lf-nilserdw8BVnHPKtkkSbw7Pcp5p7KI_V9CAlzqQI=",
//             //         fit: BoxFit.fill,
//             //         placeholder: (context, url) =>
//             //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
//             //         errorWidget: (context, url, error) =>
//             //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(width: 12.w),
//           ],
//         ),
//       )
//     );
//   }
// }



class UserDetails extends StatelessWidget {
  final String name;
  final String image;

  final bool isWelcome;
  final bool bellicon;
  final bool notificationcount;

  const UserDetails({
    super.key,
    required this.isWelcome,
    required this.bellicon,
    required this.notificationcount,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white, // Inside color as white
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),

          // gradient: LinearGradient(
          //   colors: [Colorutils.oliveGreen, Colorutils.oliveGreen,], // Define your colors
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 12.w),
                  // GestureDetector(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     height: 50.h,
                  //     width: 50.h,
                  //     padding: EdgeInsets.symmetric(horizontal: 9.h),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.1),
                  //       borderRadius: BorderRadius.circular(8.r),
                  //     ),
                  //     child: SvgPicture.asset(
                  //       "assets/images/menu_icon.svg",
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),


                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isWelcome ? 'Welcome!' : 'Hello,',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.h,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        Container(
                          child: TextScroll(
                            'Dr.Thalhath P[Chief Psychiatrist]',
                            mode: TextScrollMode.bouncing,
                            velocity:
                            const Velocity(pixelsPerSecond: Offset(50, 0)),
                            delayBefore: const Duration(seconds: 1),
                            pauseBetween: const Duration(seconds: 2),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 19.h,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                            selectable: true,
                          ),
                        ),

                        // TextScroll(
                        //   'This is the sample text for Flutter TextScroll widget. ',
                        //   mode: TextScrollMode.bouncing,
                        //   velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                        //   delayBefore: Duration(milliseconds: 500),
                        //   numberOfReps: 5,
                        //   pauseBetween: Duration(milliseconds: 50),
                        //   style: TextStyle(color: Colors.green),
                        //   textAlign: TextAlign.right,
                        //   selectable: true,
                        // )
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         controller.userData.value.name ?? "--",
                        //         style: TeacherAppFonts.interW600_18sp_textWhite,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  if (bellicon)
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) { return
                        //   TaskScreen();
                        // },));
                      },
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 5.w, top: 5.h),
                              child: bellicon
                                  ? SvgPicture.asset(
                                'assets/images/bell 1.svg',
                                color: Colors.black,
                                width: 28.h,
                                fit: BoxFit.fitWidth,
                              )
                                  : const Text("")),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 15.h,
                              height: 15.h,
                              padding: const EdgeInsets.all(2).w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.h,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  SizedBox(width: 12.w),
                  SizedBox(width: 2.w),
                  CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    radius: 26.r,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: CachedNetworkImageProvider(
                          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fcorporate-profile-picture&psig=AOvVaw0XMPH5HKIAA5wVVeMRrB9x&ust=1743493695246000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJDtuP7os4wDFQAAAAAdAAAAABAE"),
                      backgroundColor: Colors.white,
                      onBackgroundImageError: (exception, stackTrace) {
                        // Handle error (optional)
                      },
                    ),
                  ),

                  // CircleAvatar(
                  //   radius: 26.r,
                  //   child: CircleAvatar(
                  //     radius: 25.r,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(100).r,
                  //       child: CachedNetworkImage(
                  //         imageUrl:
                  //         "https://media.istockphoto.com/id/1029035836/photo/ai-robot-thinking.jpg?s=612x612&w=0&k=20&c=Lf-nilserdw8BVnHPKtkkSbw7Pcp5p7KI_V9CAlzqQI=",
                  //         fit: BoxFit.fill,
                  //         placeholder: (context, url) =>
                  //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                  //         errorWidget: (context, url, error) =>
                  //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 12.w),
                ],
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20,top: 12,bottom: 10),
              //   child: Container(
              //     height: 50.h,
              //     decoration: const BoxDecoration(
              //         border: Border(),
              //         borderRadius: BorderRadius.all(Radius.circular(30))),
              //     width: double.infinity,
              //     child: TextFormField(
              //       autofocus: true,
              //       // controller: textcontroller,
              //       onChanged: (value) async {
              //
              //       },
              //       validator: (val) =>
              //       val!.isEmpty ? 'Enter the Topic' : null,
              //       cursorColor: Colors.grey,
              //       keyboardType: TextInputType.text,
              //       decoration: InputDecoration(
              //           hintStyle: const TextStyle(color: Colors.grey),
              //           hintText: "Search Patients",
              //           prefixIcon: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: SizedBox(
              //                 height: 25,
              //                 width: 25,
              //                 child: SvgPicture.asset(
              //                     "assets/images/MagnifyingGlass.svg")),
              //           ),
              //           contentPadding: const EdgeInsets.symmetric(
              //               vertical: 10.0, horizontal: 25.0),
              //           border: const OutlineInputBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(2.0),
              //             ),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide:
              //             BorderSide(color: Colors.grey.withOpacity(0.2)),
              //             borderRadius: const BorderRadius.all(Radius.circular(30)),
              //           ),
              //           focusedBorder: const OutlineInputBorder(
              //             borderSide: BorderSide(
              //                 color: Color.fromRGBO(230, 236, 254, 8),
              //                 width: 1.0),
              //             borderRadius: BorderRadius.all(Radius.circular(30)),
              //           ),
              //           fillColor: Colors.green[50],
              //           filled: true),
              //     ),
              //   ),
              // ),
            ],
          ),
        )
    );
  }
}

class ThoughtOfTheDayWidget extends StatelessWidget {
  final String text;
  final String svgPath;
  final VoidCallback? onReadMore;

  const ThoughtOfTheDayWidget({
    Key? key,
    required this.text,
    required this.svgPath,
    this.onReadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: Colors.grey[800],fontStyle: FontStyle.italic),
                ),
                // InkWell(
                //   onTap: onReadMore,
                //   child: Text(
                //     "read more........",
                //     style: TextStyle(fontSize: 16, color: Colors.green),
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            top: -30,
            right: -10,
            child: SvgPicture.asset(
              svgPath,
              color: Colors.green,
              height: 60,
              width: 60,
            ),
          ),
          // Positioned(
          //   top: -10,
          //   left: -10,
          //   child: SvgPicture.asset(
          //     "assets/images/Lines.svg",
          //     color: Colors.green,
          //     height: 100,
          //     width: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}
