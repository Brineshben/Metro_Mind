import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../JUNIOR_DOCTOR/bottom_navigation_Junior.dart';
import '../../PATIENT/UI_PATIENT/bottom_Navigation_Patient.dart';
import '../../utils/Constants.dart';
import '../../utils/color_util.dart';
import '../HomePage/home_widgets/bottom_Navigationbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyleDark,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageIndexNavigationJunior(),));
                                },

                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 100.h),
                                    child: SizedBox(
                                      height: 80.h,
                                      // height: 180.h,
                                      child: Image.asset(
                                        "assets/images/utharam-logo.png",
                                        fit: BoxFit.cover,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Hello !',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 25.h,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Sign in to your account',
                                  style: TextStyle(
                                      fontSize: 12.h,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),

                              SizedBox(height: 5.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 2.h),
                                child: TextFormField(
                                  cursorColor: Colors.grey,
                                  controller: _usernameController,
                                  autofillHints: const [AutofillHints.username],
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      // border: UnderlineInputBorder(),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16.h)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 5.h),
                                child: TextFormField(
                                  cursorColor: Colors.grey,
                                  textInputAction: TextInputAction.done,
                                  obscureText: _obscureText,
                                  controller: _passwordController,
                                  autofillHints: const [AutofillHints.password],
                                  onEditingComplete: () =>
                                      TextInput.finishAutofillContext(),
                                  decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16.h),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(_obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 5.h)
                                    .w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontSize: 11.h,
                                            color: Colors.blue[900],
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50.h),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PageIndexNavigationChief(),
                                      ));
//                                   String user = _usernameController.text.trim();
//                                   String psw = _passwordController.text.trim();
//                                   if (user.isNotEmpty) {
//                                     if (psw.isNotEmpty) {
//                                       await Get.find<UserAuthController>()
//                                           .fetchUserData(
//                                               username: user, password: psw);
//                                       if (Get.find<UserAuthController>()
//                                           .isLoaded
//                                           .value) {
//                                          final String data =
//                                             Get.find<UserAuthController>()
//                                                     .userdata
//                                                     .value
//                                                     ?.role ??
//                                                 "";
// print("object$data");
//                                         if (data == "admin") {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     PageIndexNavigationChief(),
//                                               ));
//                                         } else if (data == "therapist") {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     PageIndexNavigationTherapist(),
//                                               ));
//                                         } else if (data == "patient") {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     PageIndexNavigationPatient(),
//                                               ));
//                                         }
//
//                                         ProductAppPopUps.submit(
//                                           title: "SUCCESS",
//                                           message: "Login successful",
//                                           actionName: "Close",
//                                           iconData: Icons.done,
//                                           iconColor: Colors.green,
//                                         );
//                                       }
//                                     } else {
//                                       ProductAppPopUps.submit(
//                                         title: "FAILED",
//                                         message: "Please Enter your Password.",
//                                         actionName: "Close",
//                                         iconData: Icons.error_outline,
//                                         iconColor: Colors.red,
//                                       );
//                                     }
//                                   } else {
//                                     ProductAppPopUps.submit(
//                                       title: "FAILED",
//                                       message: "Please Enter Your Username.",
//                                       actionName: "Close",
//                                       iconData: Icons.error_outline,
//                                       iconColor: Colors.red,
//                                     );
//                                   }
                                },
                                child: Center(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 30)
                                          .w,
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // gradient: LinearGradient(
                                        //   colors: [Colors.green.shade300, Colors.blue.shade300], // Adjust colors to match your design
                                        //   begin: Alignment.topLeft,
                                        //   end: Alignment.bottomRight,
                                        // ),
                                        color: Colorutils.userdetailcolor,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      // width: 250.w,
                                      height: 45.h,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'LOGIN',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 16.h,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      indent: 30.w,
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12.h,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                      endIndent: 30.w,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                            horizontal: 30)
                                        .w,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PageIndexNavigationPatient(),
                                              ));

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          border: Border.all(
                                            color: Colorutils.userdetailcolor,
                                            width: 0.8,
                                          ),
                                        ),
                                        // width: 250.w,
                                        height: 50.h,
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                height: 25.h,
                                                "assets/images/google_logo.png",
                                                fit: BoxFit.fitHeight,
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                'Sign in with Google',
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Center(
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.symmetric(horizontal: 30).w,
                              //     child: GestureDetector(
                              //       onTap: () async {
                              //         // context.loaderOverlay.show();
                              //         // await signIn().then(
                              //         //         (_) => context.loaderOverlay.hide());
                              //       },
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(30.r),
                              //           border: Border.all(
                              //             color: Colorutils.userdetailcolor,
                              //             width: 0.8,
                              //           ),
                              //         ),
                              //         // width: 250.w,
                              //         height: 45.h,
                              //         child: Center(
                              //           child: Row(
                              //             mainAxisSize: MainAxisSize.min,
                              //             children: [
                              //               Image.asset(
                              //                 height: 25.h,
                              //                 "assets/google_logo.png",
                              //                 fit: BoxFit.fitHeight,
                              //               ),
                              //               SizedBox(width: 8.w),
                              //               Text(
                              //                 'Sign in with Google',
                              //                 style: GoogleFonts.inter(
                              //                   fontSize: 16.h,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 150,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PageIndexNavigationTherapist(),
                                        ));
                                  },
                                  child: Text(
                                    "Version 0.1",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 10.h,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
