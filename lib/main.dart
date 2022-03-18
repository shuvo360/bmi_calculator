// ignore: prefer_const_literals_to_create_immutables
//  ignore_for_file: prefer_const_constructors
import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(BMIcalculator());
}

const activeCardColor = Color.fromARGB(255, 77, 0, 150);
const inActiveCardColor = Color.fromARGB(255, 2, 34, 48);
const textLebel = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900);

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink[400],
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: homePage(),
    );
  }
}
