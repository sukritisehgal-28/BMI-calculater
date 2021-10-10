import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.icon , @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.lightBlueAccent,
    );
  }
}
class RoundIconButton2 extends StatelessWidget {
  const RoundIconButton2({@required this.icon2 ,this.onPressed2});
  final IconData icon2;
  final Function onPressed2;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon2),
      onPressed: onPressed2,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.lightBlueAccent,
    );
  }
}

