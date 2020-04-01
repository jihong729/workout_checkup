import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'card_icons.dart';

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
  int countNumber = 0;
  SharedPreferences prefs;

  _incrementCounter() async {
    countNumber++;
    print('Pressed ${widget.iconLabel} $countNumber times.');
    await prefs.setInt('${widget.iconLabel}', countNumber);
  }

//  @override
//  initState() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    countNumber = (prefs.getInt('${widget.iconLabel}') ?? 0);
//    super.initState();
//  }

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
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onPress();
          setState(() {
            if (countNumber < kGoalNumber) _incrementCounter();
          });
          createAlert(
            context,
            countNumber,
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
                  countNumber.toString(),
                  style: kNumberFinishedTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      finishedPercent(countNumber).toString(),
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
      ),
    );
  }

  int finishedPercent(int finishedNumber) {
    double dividedNumber = finishedNumber / kGoalNumber;
    int finalPercent = (dividedNumber * 100).round();
    return finalPercent;
  }
}
