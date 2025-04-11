import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_util.dart';
import '../../CHIEF_DOCTOR/UI_CHIEF/Grid_patientdetails.dart';
import 'AiDetails.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. John Doe",
      "position": "Cardiologist",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Alice Smith",
      "position": "Neurologist",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Dr. Mark Johnson",
      "position": "Dermatologist",
      "image": "https://via.placeholder.com/150"
    },
  ];

  void _showDoctorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Only take needed height
            children: [
              // Top drag handle
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),

              // Doctor list
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                // Important for dynamic height
                physics: NeverScrollableScrollPhysics(),
                // Prevent scroll inside small sheet
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(doctor["image"]!),
                    ),
                    title: Text(
                      doctor["name"]!,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doctor["position"]!,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Handle doctor selection here
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal.shade50,
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 48.h, bottom: 5.h, left: 20.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      border: Border.all(
                                        color: Colors.blue, // Border color
                                        width: 0.1, // Border width
                                      ),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     blurRadius: 1,
                                      //     spreadRadius: 0,
                                      //   ),
                                      // ],
                                      borderRadius:
                                          BorderRadius.circular(15).r),
                                  child: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "PATIENT DETAILS",
                                  style: GoogleFonts.shanti(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PatientCard(
                          patientName: 'John Doe',
                          email: 'john@example.com',
                          emailDetail: 'Referred by Dr. Smith',
                          diseaseDetail: 'Diabetes Type 2',
                          age: 45,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 25.h, left: 20.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AI Diagnosis Report",
                                style: GoogleFonts.shanti(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AiReport(
                            summary:
                                'John Doe, a 34-year-old male, was admitted on March 14, 2025, with symptoms of schizoaffective disorder, bipolar type. He exhibited erratic behavior, hallucinations, and mood swings ranging from mania to depression. His mental status showed disorganized thoughts, poor judgment, and impaired insight. He has a psychiatric history dating back to age 27 and limited social support. The treatment plan includes antipsychotic and mood stabilizer medications, CBT, group therapy, and social support services. Prognosis is guarded, with ongoing monitoring and therapy recommended.',
                            details: "details"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colorutils.userdetailcolor,
                                      width: 0.5,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [Colors.teal.shade50, Colors.white],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Diagnosis Suggestion',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey)),
                                        SizedBox(height: 8),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Major Depressive Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),   Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),   Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),   Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),   Text('-Mental Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                        Text('-Generalise Anxiety Disorder',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colorutils.userdetailcolor,
                                          width: 0.5,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [Colors.teal.shade50, Colors.white],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('MSE Highlights',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey)),
                                          const SizedBox(height: 5),

                                          Text('-Mental Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                          Text('-Generalise Anxiety Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colorutils.userdetailcolor,
                                          width: 0.5,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [Colors.teal.shade50, Colors.white],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Text('Flagged Alerts',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey)),
                                          const SizedBox(height: 5),

                                          Text('-Mental Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                          Text('-Generalise Anxiety Disorder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Observation',
                                  style: TextStyle(
                                      fontSize: 16.w, fontWeight: FontWeight.bold,color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 5.h,
                            right: 20.w,
                            bottom: 5.h,
                          ),
                          child: TextFormField(
                            autovalidateMode:AutovalidateMode.onUserInteraction,

                            maxLength: 100,
                            // controller: _Remarkscontroller,
                            validator: (val) => val!.trim().isEmpty
                                ? 'Please Enter Observation.'
                                : null,
                            decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 20.w),
                                hintText: " Enter Observation   ",
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ).r,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colorutils.userdetailcolor, width: 1.0),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colorutils.userdetailcolor, width: 1.0),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0))
                                      .r,
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
              // Adjust colors to match your design
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [Colors.green.shade300, Colors.blue.shade300], // Adjust colors to match your design
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      color: Colorutils.userdetailcolor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    width: 200.w,
                    height: 45.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Recommend Specialists',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    _showDoctorBottomSheet(context);
                  },
                ),
                GestureDetector(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: Colorutils.userdetailcolor,
                            width: 0.8,
                          ),
                        ),
                        // width: 250.w,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Make Appointment',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final String patientName;
  final String email;
  final String emailDetail;
  final String diseaseDetail;
  final int age;

  const PatientCard({
    Key? key,
    required this.patientName,
    required this.email,
    required this.emailDetail,
    required this.diseaseDetail,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Name:', patientName),
            _buildTitle('Age:', age.toString()),
            _buildTitle('Disease:', diseaseDetail),
            _buildTitle('Email:', email),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        "HIGH",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class AiReport extends StatelessWidget {
  final String summary;
  final String details;

  const AiReport({
    Key? key,
    required this.summary,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SUMMARY : ",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildTitle('      ', summary),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Your onPressed code here
                  },
                  icon: Icon(Icons.download),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colorutils.userdetailcolor,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        "View",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colorutils.userdetailcolor,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        "APPROVE",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          // Ensure ColorUtils is defined or use a custom color.
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h, // Ensure you're using flutter_screenutil to define font size responsively.
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
