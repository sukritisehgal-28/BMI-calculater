import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'resuse.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

   final String bmiResult;
   final String resultText;
   final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),


      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: titleTextStyle,
            ),
          ),
          ),
          Expanded(
              flex: 5,
              child: Resuse(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children:<Widget> [
                    Text(
                      resultText.toUpperCase(),
                      style:resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: bmiTextStyle,
                    ),
                    Center(
                      child: Text(
                        interpretation,
                        style: bodyTextStyle,
                      ),
                    )

                  ],
                ),
          ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
            },
              buttonTitle: 'RE-CALCULATE'
          ),
        ],
      ),

    );
  }
}
