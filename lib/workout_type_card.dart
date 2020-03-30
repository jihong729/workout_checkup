import 'package:flutter/material.dart';

class WorkoutTypeCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  WorkoutTypeCard({this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}