import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_util.dart';

class ProductAppPopUps {
  static final ProductAppPopUps _instance = ProductAppPopUps._internal();

  ProductAppPopUps._internal();

  factory ProductAppPopUps() {
    return _instance;
  }

  static submit({
    String? title,
    required String message,
    required String actionName,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 50.h,
            ),
            if (title != null) SizedBox(height: 10.w),
            if (title != null)
              Text(
                title,
                style: GoogleFonts.oxygen(
                    color: Colors.blueGrey,
                    fontSize: 18.h,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.h, color: Colors.blueGrey),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colorutils.userdetailcolor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actionName,
                  style: TextStyle(color: Colors.white, fontSize: 16.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static submitLogOut({
    required BuildContext context,
    String? title,
    required String message,
    required String actionName,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 50.h,
            ),
            if (title != null) SizedBox(height: 10.w),
            if (title != null)
              Text(
                title,
                style: GoogleFonts.oxygen(
                    color: Colors.black,
                    fontSize: 18.h,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.h),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () async {
              Get.back();
             //  await HandleControllers.deleteAllGetControllers();
             // await  SharedPrefs().removeLoginData();
             //   HandleControllers.createGetControllers();
             //
             //  Navigator.of(context).pushAndRemoveUntil(
             //      MaterialPageRoute(builder: (context) => const LoginPage()),
             //      (_) => false);
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colorutils.userdetailcolor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actionName,
                  style: TextStyle(color: Colors.white, fontSize: 16.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static submitLogOut2({
    required BuildContext context,
    String? title,
    required String message,
    required String actionName,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 50.h,
            ),
            if (title != null) SizedBox(height: 10.w),
            if (title != null)
              Text(
                title,
                style: GoogleFonts.oxygen(
                    color: Colors.black,
                    fontSize: 18.h,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.h),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () {
              Get.back();
              // HandleControllers.deleteAllGetControllers();
              // SharedPrefs().removeLoginData();
              //
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => const LoginPage()),
              //         (_) => false);
              //
              // HandleControllers.createGetControllers();
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colorutils.userdetailcolor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actionName,
                  style: TextStyle(color: Colors.white, fontSize: 16.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // static submit3back({
  //   String? title,
  //   required String message,
  //   required String actionName,
  //   required IconData iconData,
  //   required Color iconColor,
  // }) {
  //   return Get.dialog(
  //     AlertDialog(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       ),
  //       title: Column(
  //         children: [
  //           Icon(
  //             iconData,
  //             color: iconColor,
  //             size: 50.h,
  //           ),
  //           if (title != null) SizedBox(height: 10.w),
  //           if (title != null)
  //             Text(
  //               title,
  //               style: GoogleFonts.oxygen(
  //                   color: Colors.black,
  //                   fontSize: 18.h,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //         ],
  //       ),
  //       content: Text(
  //         message,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 16.h),
  //       ),
  //       actionsAlignment: MainAxisAlignment.center,
  //       actions: [
  //         FilledButton(
  //           onPressed: () {
  //             Get.back();
  //             Get.back();
  //             Get.back();
  //           },
  //           style: ButtonStyle(
  //             backgroundColor:
  //                 WidgetStateProperty.all(ColorUtils.userdetailcolor),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 actionName,
  //                 style: TextStyle(color: Colors.white, fontSize: 16.h),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // } static submit2back({
  //   String? title,
  //   required String message,
  //   required String actionName,
  //   required IconData iconData,
  //   required Color iconColor,
  // }) {
  //   return Get.dialog(
  //     AlertDialog(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       ),
  //       title: Column(
  //         children: [
  //           Icon(
  //             iconData,
  //             color: iconColor,
  //             size: 50.h,
  //           ),
  //           if (title != null) SizedBox(height: 10.w),
  //           if (title != null)
  //             Text(
  //               title,
  //               style: GoogleFonts.oxygen(
  //                   color: Colors.black,
  //                   fontSize: 18.h,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //         ],
  //       ),
  //       content: Text(
  //         message,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 16.h),
  //       ),
  //       actionsAlignment: MainAxisAlignment.center,
  //       actions: [
  //         FilledButton(
  //           onPressed: () {
  //             Get.back();
  //             Get.back();
  //
  //           },
  //           style: ButtonStyle(
  //             backgroundColor:
  //                 WidgetStateProperty.all(ColorUtils.userdetailcolor),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 actionName,
  //                 style: TextStyle(color: Colors.white, fontSize: 16.h),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
