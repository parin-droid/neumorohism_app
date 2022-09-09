import 'package:flutter/material.dart';
import 'package:neumorohism_app/custom_widget/custom_switch_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomSwitchButton(isChecked: isChecked),
    );
  }
}