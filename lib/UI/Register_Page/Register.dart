import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/Constants.dart';
import '../../utils/color_util.dart';
import '../ChatScreen/Chat.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade50,
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: 20.h),
                    //     child: SizedBox(
                    //       height: 100.h,
                    //       // height: 180.h,
                    //       child: SvgPicture.asset(
                    //         'assets/IHUB LOGO.svg',
                    //         width: 150.w,
                    //         fit: BoxFit.fitWidth,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: SizedBox(
                          height: 80.h,
                          // height: 180.h,
                          child: Image.asset(
                            "assets/images/utharam-logo.png",
                            fit: BoxFit.cover,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.w),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18.h,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Icon(Icons.person_add,color: Colorutils.userdetailcolor,),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'Please Enter Your Details',
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        "Username", "assets/images/user.svg", false, username),
                    buildTextField(
                        "Email", "assets/images/envelope.svg", false, email),
                    buildTextField("Phone Number",
                        "assets/images/phone-call.svg", false, phoneNumber),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField("Age", "assets/images/age.svg",
                              false, phoneNumber),
                        ),
                        Expanded(
                          child: buildTextField("Gender",
                              "assets/images/venus.svg", false, phoneNumber),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                              "Education",
                              "assets/images/graduation-cap.svg",
                              false,
                              phoneNumber),
                        ),
                        Expanded(
                          child: buildTextField(
                              "Occupation",
                              "assets/images/briefcase-blank.svg",
                              false,
                              phoneNumber),
                        ),
                      ],
                    ),

                    buildTextField("Address", "assets/images/address-book.svg",
                        false, phoneNumber),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: _obscureText1,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colorutils.userdetailcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3)),
                            ),
                            prefixIcon: Icon(Icons.lock_outline_rounded,
                                color: Colors.grey),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3)),
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText1 = !_obscureText1;
                                  });
                                },
                                child: Icon(_obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30).w,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen();
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade200,
                                Colors.blue.shade200
                              ], // Adjust colors to match your design
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          // width: 250.w,
                          height: 45.h,
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

Widget buildTextField(String hintText, String svgAssetPath, bool isPassword,
    TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0), // Adjust padding as needed
          child: SvgPicture.asset(
            svgAssetPath,
            width: 10.w,
            height: 10.h,
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colorutils.userdetailcolor),
        ),
      ),
    ),
  );
}
