import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class iconcontext extends StatelessWidget {
  const iconcontext({@required this.icon,this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
            style:TextStyle(
              fontSize: 18.0,color: Colors.white,
            )
        ),
      ],
    );
  }
}
