import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1d3557),
          scaffoldBackgroundColor:Color(0xFF1d3557),
      ),
    home: InputPage(),
    );
  }
}


