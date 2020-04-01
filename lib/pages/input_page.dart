import 'package:flutter/material.dart';
import 'package:workoutcheckup/widgets/workout_type_card.dart';

import '../constants.dart';

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
  Workout selectedWorkout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'THE 15 X WORKOUT CHALLENGE',
          style: TextStyle(
              color: Color(0xFF2e7d32), fontSize: 25.0, fontFamily: 'Anton'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                WorkoutTypeCard(
                  onPress: () {
                    setState(() {
                      selectedWorkout = Workout.UpperBody;
                    });
                  },
                  color: selectedWorkout == Workout.UpperBody
                      ? kActivatedBackgroundColor
                      : kDeactivatedBackgroundColor,
                  iconLabel: "UpperBody",
                ),
                WorkoutTypeCard(
                  onPress: () {
                    setState(() {
                      selectedWorkout = Workout.LowerBody;
                    });
                  },
                  color: selectedWorkout == Workout.LowerBody
                      ? kActivatedBackgroundColor
                      : kDeactivatedBackgroundColor,
                  iconLabel: 'LowerBody',
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                WorkoutTypeCard(
                  onPress: () {
                    setState(() {
                      selectedWorkout = Workout.Range;
                    });
                  },
                  color: selectedWorkout == Workout.Range
                      ? kActivatedBackgroundColor
                      : kDeactivatedBackgroundColor,
                  iconLabel: 'Range',
                ),
                WorkoutTypeCard(
                  onPress: () {
                    setState(() {
                      selectedWorkout = Workout.Cardio;
                    });
                  },
                  color: selectedWorkout == Workout.Cardio
                      ? kActivatedBackgroundColor
                      : kDeactivatedBackgroundColor,
                  iconLabel: 'Cardio',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
