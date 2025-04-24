import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/color_util.dart';
import '../../Register_Page/Register.dart';
import 'package:flutter_svg/svg.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  TextEditingController phoneNumber = TextEditingController();
  List<String> data = [];

  void add(String value) {
    setState(() {
      data.add(value);
    });
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
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "ADD MEDICINE",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 2,
                      color: Colors.teal.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            buildTextFieldMedicine(
                                "Medicine",
                                "assets/images/phone-call.svg",
                                false,
                                phoneNumber,
                                true),

                            Row(
                              children: [
                                Expanded(
                                  child: buildTextFieldMedicine(
                                      "Medicine",
                                      "assets/images/phone-call.svg",
                                      false,
                                      phoneNumber,
                                      true),
                                ),
                                Expanded(
                                  child: buildTextFieldMedicine(
                                      "Medicine",
                                      "assets/images/phone-call.svg",
                                      false,
                                      phoneNumber,
                                      true),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: buildTextFieldMedicine(
                                      "Medicine",
                                      "assets/images/phone-call.svg",
                                      false,
                                      phoneNumber,
                                      true),
                                ),
                                Expanded(
                                  child: buildTextFieldMedicine(
                                      "Medicine",
                                      "assets/images/phone-call.svg",
                                      false,
                                      phoneNumber,
                                      true),
                                ),
                                Expanded(
                                  child: buildTextFieldMedicine(
                                      "Medicine",
                                      "assets/images/phone-call.svg",
                                      false,
                                      phoneNumber,
                                      true),
                                ),
                              ],
                            ),
                            Text(
                              data[index],
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3),
              blurRadius: 0.1,
              spreadRadius: 0.1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:", style: TextStyle(fontSize: 16.sp)),
              Text("300", style: TextStyle(fontSize: 16.sp)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add("Medicine ${data.length + 1}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildTextFieldMedicine(String hintText, String svgAssetPath,
    bool isPassword, TextEditingController controller, bool validation) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
    child: SizedBox(
      height: 40, // Set your desired height
      width: double.infinity, // Or set a specific width like 300
      child: TextFormField(
        validator: validation
            ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
            : null,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(
            fontSize: 15.h,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.only(left: 5,right: 1,top: 10,bottom: 10),
          //   child: SvgPicture.asset(
          //     svgAssetPath,
          //     width: 5.w,
          //     height: 5.h,
          //     color: Colors.grey,
          //   ),
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor),
          ),
        ),
      ),
    ),
  );
}

