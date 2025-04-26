import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssesmentPage extends StatelessWidget {
  const AssesmentPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Center(
            child: const Text(
              "Feature under maintenance",
              style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic),
            ),
          )),
    );
  }
}
