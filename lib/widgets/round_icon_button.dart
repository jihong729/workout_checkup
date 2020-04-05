import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF9e9e9e),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      elevation: 0.0,
      enableFeedback: true,
    );
  }
}
