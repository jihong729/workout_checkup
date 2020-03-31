import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:workoutcheckup/card_icons.dart';
import 'package:workoutcheckup/workout_type_card.dart';

import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Workout {
  UpperBody,
  LowerBody,
  Range,
  Cardio,
}

class _InputPageState extends State<InputPage> {
  int upperBodyFinishedNumber = 0;
  int lowerBodyFinishedNumber = 0;
  int rangeFinishedNumber = 0;
  int cardioFinishedNumber = 0;
  int goalNumber = 15;
  Workout selectedWorkout;

  WorkoutTypeCard workoutTypeCard = WorkoutTypeCard();

  int finishedPercent(int finishedNumber) {
    double dividedNumber = finishedNumber / goalNumber;
    int finalPercent = (dividedNumber * 100).round();
    return finalPercent;
  }

  void createAlert(int workoutNumber, String workoutName) {
    if (workoutNumber == goalNumber) {
      Alert(
        context: context,
        title: "Awesome!",
        desc: "You finished the Goal for $workoutName.",
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'THE 15 WORKOUT CHALLENGE',
          style: TextStyle(
              color: Color(0xFF2e7d32), fontSize: 20.0, fontFamily: 'Anton'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WorkoutTypeCard(
                    onPress: () {
                      setState(() {
                        selectedWorkout = Workout.UpperBody;
                        upperBodyFinishedNumber++;
                        createAlert(
                          upperBodyFinishedNumber,
                          'UpperBody',
                        );
                      });
                    },
                    color: selectedWorkout == Workout.UpperBody
                        ? kActivatedBackgroundColor
                        : kDeactivatedBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardIcons(
                          label: 'UpperBody',
                          imageName: AssetImage('icons/upperBody.png'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            upperBodyFinishedNumber.toString(),
                            style: kNumberFinishedTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                finishedPercent(upperBodyFinishedNumber)
                                    .toString(),
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
                  ),
                ),
                Expanded(
                  child: WorkoutTypeCard(
                    onPress: () {
                      setState(() {
                        selectedWorkout = Workout.LowerBody;
                        lowerBodyFinishedNumber++;
                        createAlert(
                          lowerBodyFinishedNumber,
                          'LowerBody',
                        );
                      });
                    },
                    color: selectedWorkout == Workout.LowerBody
                        ? kActivatedBackgroundColor
                        : kDeactivatedBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardIcons(
                          label: 'LowerBody',
                          imageName: AssetImage('icons/lowerBody.png'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            lowerBodyFinishedNumber.toString(),
                            style: kNumberFinishedTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                finishedPercent(lowerBodyFinishedNumber)
                                    .toString(),
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WorkoutTypeCard(
                    onPress: () {
                      setState(() {
                        selectedWorkout = Workout.Range;
                        rangeFinishedNumber++;
                        createAlert(
                          rangeFinishedNumber,
                          'Range',
                        );
                      });
                    },
                    color: selectedWorkout == Workout.Range
                        ? kActivatedBackgroundColor
                        : kDeactivatedBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardIcons(
                          label: 'Range',
                          imageName: AssetImage('icons/range.png'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            rangeFinishedNumber.toString(),
                            style: kNumberFinishedTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                finishedPercent(rangeFinishedNumber).toString(),
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
                  ),
                ),
                Expanded(
                  child: WorkoutTypeCard(
                    onPress: () {
                      setState(() {
                        selectedWorkout = Workout.Cardio;
                        cardioFinishedNumber++;
                        createAlert(
                          cardioFinishedNumber,
                          'Cardio',
                        );
                      });
                    },
                    color: selectedWorkout == Workout.Cardio
                        ? kActivatedBackgroundColor
                        : kDeactivatedBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardIcons(
                          label: 'Cardio',
                          imageName: AssetImage('icons/cardio.png'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            cardioFinishedNumber.toString(),
                            style: kNumberFinishedTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                finishedPercent(cardioFinishedNumber)
                                    .toString(),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
