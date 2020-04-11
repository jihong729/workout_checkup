import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const Color kActivatedBackgroundColor = Color(0xFF9E9E9E);
const Color kDeactivatedBackgroundColor = Color(0x299E9E9E);
const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFFc6ff00),
  fontWeight: FontWeight.bold,
);

const TextStyle kNumberFinishedTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 50,
  color: Color(0xFFFDD835),
);

const kGoalNumber = 15;

const kAlertButtonTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFFc6ff00),
  fontWeight: FontWeight.bold,
);

const kAlertStyle = AlertStyle(
  titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
  descStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: Duration(milliseconds: 400),
);
