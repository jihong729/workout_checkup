import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'card_icons.dart';
import 'constants.dart';

class WorkoutTypeCard extends StatefulWidget {
  final Color color;
  final Function onPress;
  final String iconLabel;

  WorkoutTypeCard({
    @required this.color,
    @required this.onPress,
    @required this.iconLabel,
  });

  @override
  _WorkoutTypeCardState createState() => _WorkoutTypeCardState();
}

class _WorkoutTypeCardState extends State<WorkoutTypeCard> {
  int finishedNumber = 0;

  void createAlert(
      BuildContext context, int workoutNumber, String workoutName) {
    if (workoutNumber == kGoalNumber) {
      Alert(
        context: context,
        title: "Awesome!",
        desc: "You finished the Goal for $workoutName.",
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        setState(() {
          if (finishedNumber < kGoalNumber) finishedNumber++;
        });
        createAlert(
          context,
          finishedNumber,
          widget.iconLabel,
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardIcons(
              label: '${widget.iconLabel}',
              imageName: AssetImage('icons/${widget.iconLabel}.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                finishedNumber.toString(),
                style: kNumberFinishedTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    finishedPercent(finishedNumber).toString(),
                    style: kNumberFinishedTextStyle,
                  ),
                  Text(
                    '%',
                    style: kNumberFinishedTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: widget.color),
      ),
    );
  }

  int finishedPercent(int finishedNumber) {
    double dividedNumber = finishedNumber / kGoalNumber;
    int finalPercent = (dividedNumber * 100).round();
    return finalPercent;
  }
}
