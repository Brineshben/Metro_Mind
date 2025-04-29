import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Roles_UI/UI/Register_Page/Register.dart';
import 'package:patient/utils/color_util.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = "";

  void _submitOtp() {
    if (_otpCode.length == 6) {
      // You can validate OTP here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Submitted OTP: $_otpCode")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter full OTP")),
      );
    }
  }

  void _resendOtp() {
    // You can call your resend OTP API here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Resent")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade50,
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the 6-digit OTP sent to your number",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // OTP Text Field
              OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.blue,
                focusedBorderColor:Colorutils.userdetailcolor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle validation if needed
                },
                onSubmit: (String verificationCode) {
                  setState(() {
                    _otpCode = verificationCode;
                  });
                }, // end onSubmit
              ),
              const SizedBox(height: 50),


              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                  _submitOtp
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorutils.userdetailcolor,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.green.shade200,
                    //     Colors.blue.shade200
                    //   ], // Adjust colors to match your design
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  // width: 250.w,
                  height: 45.h,
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.h,
                      ),
                    ),
                  ),
                ),
              ),
              // Resend Button
              const SizedBox(height: 15),

              TextButton(
                onPressed: _resendOtp,
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
