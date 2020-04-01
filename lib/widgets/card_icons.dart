import 'package:flutter/material.dart';

import '../constants.dart';

class CardIcons extends StatelessWidget {
  final String label;
  final AssetImage imageName;

  CardIcons({
    this.label,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: imageName,
          width: 50,
          height: 50,
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
