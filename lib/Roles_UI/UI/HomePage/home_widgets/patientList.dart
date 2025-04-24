import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollablePatientTable extends StatelessWidget {
  final List<String> headers = ['Name', 'Last Session', 'Status', 'Next Session', 'Actions'];

  final List<Map<String, String>> patients = [
    {
      'name': 'Alex Johnson',
      'lastSession': 'Yesterday',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Tomorrow, 2:00 PM',
    },
    {
      'name': 'Maria Garcia',
      'lastSession': '3 days ago',
      'status': 'Stable',
      'statusColor': 'green',
      'nextSession': 'Friday, 10:00 AM',
    },
    {
      'name': 'John Doe',
      'lastSession': '5 days ago',
      'status': 'Critical',
      'statusColor': 'red',
      'nextSession': 'Next Week',
    },
    {
      'name': 'Emma Brown',
      'lastSession': '2 weeks ago',
      'status': 'Stable',
      'statusColor': 'green',
      'nextSession': 'Monday, 9:00 AM',
    },
    {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },  {
      'name': 'James Wilson',
      'lastSession': '1 month ago',
      'status': 'High Risk',
      'statusColor': 'red',
      'nextSession': 'Not Scheduled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            // Table Header


            // Scrollable Table
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green, // Border color
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Table Header Row
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Row(
                          children: headers.map((header) {
                            return Container(
                              width: 150,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Text(
                                header.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      // Table Rows (Scrollable)
                      Column(
                        children: patients.map((patient) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                            ),
                            child: Row(
                              children: [
                                _buildCell(patient['name']!, isBold: true),
                                _buildCell(patient['lastSession']!),
                                _buildStatusCell(patient['status']!, patient['statusColor']!),
                                _buildCell(patient['nextSession']!),
                                _buildActionButton(),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell(String text, {bool isBold = false}) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(4),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildStatusCell(String text, String color) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color == 'red' ? Colors.red[400] : Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          side: BorderSide(color: Colors.green),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('View Profile'),
      ),
    );
  }
}