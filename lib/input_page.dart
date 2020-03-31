import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  int finishedPercent(int finishedNumber) {
    double dividedNumber = finishedNumber / goalNumber;
    int finalPercent = (dividedNumber * 100).round();
    return finalPercent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('THE 15 WORKOUT CHALLENGE',
            style: TextStyle(color: Color(0xFF2e7d32), fontSize: 20.0)),
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
                        print(upperBodyFinishedNumber);
                        print(finishedPercent(upperBodyFinishedNumber));
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
                          iconName: FontAwesomeIcons.arrowUp,
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
                        print(lowerBodyFinishedNumber);
                        print(finishedPercent(lowerBodyFinishedNumber));
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
                          iconName: FontAwesomeIcons.arrowUp,
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
                        print(rangeFinishedNumber);
                        print(finishedPercent(rangeFinishedNumber));
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
                          iconName: FontAwesomeIcons.arrowUp,
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
                        print(cardioFinishedNumber);
                        print(finishedPercent(cardioFinishedNumber));
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
                          iconName: FontAwesomeIcons.arrowUp,
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
