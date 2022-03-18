import 'package:bmi_calculator/Reusable_BoxCard.dart';
import 'package:bmi_calculator/home_page.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

const normalTextStyle =
    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white);

class resultPage extends StatelessWidget {
  final String calculate;
  final String status;
  final String message;

  resultPage(
      {required this.calculate, required this.message, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Result",
          style: textLebel,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your BMI Result',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reuseableBoxcard(
              carBoxColor: Color(0xFF121224),
              childcard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status,
                    style: normalTextStyle,
                  ),
                  Text(
                    calculate,
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculateButton(
                    buttonName: 'Recalculate',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
