import 'package:calculator_ui/screens/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Calculator(),
    );
  }
}