import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertCreater {
  BuildContext context;
  int goalNumber;
  AlertStyle alertStyle;
  TextStyle alertButtonTextStyle;

  AlertCreater(
      {@required this.alertButtonTextStyle,
      @required this.alertStyle,
      @required this.goalNumber,
      @required this.context});

  void createAlert(
      BuildContext context, int workoutNumber, String workoutName) {
    if (workoutNumber == goalNumber) {
      // TODO: Refactor this Alert to a separate dart file(alerts.dart)
      Alert(
          style: alertStyle,
          context: context,
          title: "Awesome!",
          desc: "You finished the Goal for $workoutName.",
          image: Image.asset('images/complete.png'),
          buttons: [
            DialogButton(
              child: Text(
                'COOL',
                style: alertButtonTextStyle,
              ),
              color: Colors.grey.shade700,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]).show();
    }
  }
}
