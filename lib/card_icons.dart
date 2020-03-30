import 'package:flutter/material.dart';

import 'constants.dart';

class CardIcons extends StatelessWidget {
  final String label;
  final IconData iconName;

  CardIcons({
    this.label,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 50,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
