import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AssessmentListPage extends StatelessWidget {
  final List<Map<String, dynamic>> patients = [
    {
      'name': 'John Doe',
      'age': 34,
      'lastAssessment': '2025-04-03',
      'summary': 'Stable mood, mild anxiety',
      'status': 'Stable',
    },
    {
      'name': 'Jane Smith',
      'age': 28,
      'lastAssessment': '2025-03-30',
      'summary': 'Depressive symptoms observed',
      'status': 'Critical',
    },
    {
      'name': 'Mark Lee',
      'age': 42,
      'lastAssessment': '2025-04-01',
      'summary': 'Improving condition',
      'status': 'Improving',
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Critical':
        return Colors.red.shade300;
      case 'Improving':
        return Colors.orange.shade300;
      case 'Stable':
        return Colors.green.shade300;
      default:
        return Colors.grey.shade400;
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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 50,bottom: 10),
              child: Text(
                "ASSESMENT",
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
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: getStatusColor(patient['status']),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(patient['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Age: ${patient['age']}'),
                          Text('Last Assessment: ${patient['lastAssessment']}'),
                          Text('Summary: ${patient['summary']}'),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Handle menu actions
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'view', child: Text('View')),
                          PopupMenuItem(value: 'edit', child: Text('Edit')),
                          PopupMenuItem(value: 'add', child: Text('New Assessment')),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}