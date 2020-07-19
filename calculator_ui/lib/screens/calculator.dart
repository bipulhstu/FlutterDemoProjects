import 'package:calculator_ui/models/display.dart';
import 'package:calculator_ui/models/key_controller.dart';
import 'package:calculator_ui/models/key_pad.dart';
import 'package:calculator_ui/models/processor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {

  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String _output;

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() { _output = data; }));
    Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;

    double buttonSize = screen.width / 4;
    double displayHeight = screen.height - (buttonSize * 4) - (buttonSize);

    return Scaffold(
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Display(value: _output, height: displayHeight),
          KeyPad(),
        ],
      ),
    );
  }
}