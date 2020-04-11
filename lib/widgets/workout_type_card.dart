import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'card_icons.dart';
import 'round_icon_button.dart';

class WorkoutTypeCard extends StatefulWidget {
  final Color color;
  final Function onPress;
  final String iconLabel;

  WorkoutTypeCard({
    this.color,
    this.onPress,
    this.iconLabel,
  });

  @override
  _WorkoutTypeCardState createState() => _WorkoutTypeCardState();
}

class _WorkoutTypeCardState extends State<WorkoutTypeCard> {
  int countNumber = 0;
  SharedPreferences prefs;

  _incrementCounter() async {
    countNumber++;
    await prefs.setInt('${widget.iconLabel}', countNumber);
    print('Pressed ${widget.iconLabel} $countNumber times.');
  }

//TODO: solve the error that is activated when using initState()
  @override
  void initState() {
    super.initState();
    getRecentResults();
  }

  void getRecentResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    countNumber = (prefs.getInt('${widget.iconLabel}') ?? 0);
  }

  int finishedPercent(int finishedNumber) {
    double dividedNumber = finishedNumber / kGoalNumber;
    int finalPercent = (dividedNumber * 100).round();
    return finalPercent;
  }

  void createAlert(
      BuildContext context, int workoutNumber, String workoutName) {
    if (workoutNumber == kGoalNumber) {
      // TODO: Refactor this Alert to a separate dart file(alerts.dart)
      Alert(
          style: kAlertStyle,
          context: context,
          title: "Awesome!",
          desc: "You finished the Goal for $workoutName.",
          image: Image.asset('images/complete.png'),
          buttons: [
            DialogButton(
              child: Text(
                'COOL',
                style: kAlertButtonTextStyle,
              ),
              color: Colors.grey.shade700,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: widget.color),
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
                margin: EdgeInsets.symmetric(vertical: 10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPress: () {
                      setState(() {
                        if (countNumber > 0) countNumber--;
                      });
                      WorkoutTypeCard(color: kActivatedBackgroundColor);
                    },
                  ),
                  RoundIconButton(
                    icon: Icons.add,
                    onPress: () {
                      setState(() {
                        if (countNumber < kGoalNumber) _incrementCounter();
                      });
                      WorkoutTypeCard(color: kActivatedBackgroundColor);
                      createAlert(
                        context,
                        countNumber,
                        widget.iconLabel,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
