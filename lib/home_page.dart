import 'package:bmi_calculator/Reusable_BoxCard.dart';
import 'package:bmi_calculator/calculation.dart';
import 'package:bmi_calculator/icon_data.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/reasult.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inActiveCardColor;
  int hight = 180;
  int _age = 19;
  int weight = 60;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
        femaleCardColor = activeCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF0C0F1E),
        title: const Text(
          "BMI Calculator",
          style: textLebel,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: reuseableBoxcard(
                      carBoxColor: maleCardColor,
                      childcard: const iconData(
                          icon: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: reuseableBoxcard(
                      carBoxColor: femaleCardColor,
                      childcard: const iconData(
                          icon: FontAwesomeIcons.venus, label: 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reuseableBoxcard(
                    carBoxColor: Color.fromARGB(255, 61, 61, 121),
                    childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hight',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              hight.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          min: 120.0,
                          max: 220,
                          value: hight.toDouble(),
                          activeColor: Color.fromARGB(255, 0, 82, 150),
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue) {
                            setState(() {
                              hight = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reuseableBoxcard(
                    carBoxColor: Color.fromARGB(255, 61, 61, 121),
                    childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          weight.toString(),
                          style: textLebel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                              width: 40.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuseableBoxcard(
                    carBoxColor: Color.fromARGB(255, 61, 61, 121),
                    childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          _age.toString(),
                          style: textLebel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                              width: 40.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(
                                Icons.remove,
                              ),
                              onPressed: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                CalculateBrain cal =
                    CalculateBrain(hight: hight, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultPage(
                      calculate: cal.getCalculate(),
                      status: cal.getStatus(),
                      message: cal.getMassege(),
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculateButton(
                    buttonName: 'Calculate',
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

class CalculateButton extends StatelessWidget {
  final String buttonName;

  const CalculateButton({required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        buttonName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      color: Colors.blue[700],
    );
  }
}
