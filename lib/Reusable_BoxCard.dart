//  ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class reuseableBoxcard extends StatelessWidget {
  final carBoxColor;
  final childcard;

  reuseableBoxcard({required this.carBoxColor, this.childcard});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childcard,
      height: 250.0,
      width: 170.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: carBoxColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
