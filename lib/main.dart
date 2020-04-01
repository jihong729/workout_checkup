import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(WorkoutCheckupApp());

class WorkoutCheckupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}
