import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuse.dart';
import 'icon_context.dart';
import 'constants.dart';
import 'round_icons.dart';
import 'results_page.dart';
import 'calculation.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Color maleCardColour=inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
 //1=male 2= female

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour=inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }

    if (gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour=inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  int height =180;
  int weight =60;
  int age =18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children:<Widget>[
        Expanded(
            child: Row(
          children: <Widget> [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(1);
                  });
                },
                child: Resuse(
                  colour :maleCardColour,
                  cardChild: iconcontext(icon: FontAwesomeIcons.mars,label: 'MALE',) ,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                 setState(() {
                updateColour(2);
            });
              },
                child: Resuse(
                    colour :femaleCardColour,
                    cardChild: iconcontext(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                 ),
              ),
            ),
        ],
    )),
        Expanded(child: Resuse(
            colour : activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:<Widget> [
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: textStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                         RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                         RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(
          children: <Widget> [
            Expanded(
              child: Resuse(
                colour : activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      'WEIGHT',
                      style: textStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      onPressed: (){
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                    ]
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Resuse(colour :
              activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text(
                    'AGE',
                    style: textStyle,
                  ),
                  Text(
                    age.toString(),
                    style: numberTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        RoundIconButton2(
                          icon2: FontAwesomeIcons.plus,
                          onPressed2: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton2(
                          icon2: FontAwesomeIcons.minus,
                          onPressed2: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ]
                  ),
                ],
              ),
            ),
            ),
          ],
        )),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap: (){
            Calculation calc=
               Calculation(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(

              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),
            ),
            );
          },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.onTap, @required this.buttonTitle });

  final Function onTap;
  final String  buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: largeTextStyle,)),
        color:  Colors.pinkAccent,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 24.0),
        width: double.infinity ,
        height: bottomContainerHeight,

      ),
    );
  }
}

