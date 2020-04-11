import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
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
