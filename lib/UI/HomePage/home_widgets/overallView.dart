import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Define a model for tickets data
class TicketsData {
  final String name;
  final String number;

  TicketsData({
    required this.name,
    required this.number,
  });
}

class Tickets extends StatelessWidget {
  final List<TicketsData> ticketList;

  const Tickets({Key? key, required this.ticketList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 8, right: 8).w,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ticketList.length,
        // Use dynamic itemCount
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w,
          mainAxisExtent: 70.w,
        ),
        itemBuilder: (context, index) {
          final data = ticketList[index]; // Access data dynamically

          return GestureDetector(
            onTap: () {
              // Handle tap action
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade100, Colors.blue.shade100],
                  // Adjust colors to match your design
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0).r,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45.w,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0).r,
                    ),
                    child: Center(
                      child: Text(
                        data.number, // Use dynamic data
                        style:
                            const TextStyle(fontSize: 20, color: Colors.green,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      data.name, // Use dynamic data
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.green),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
