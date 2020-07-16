import 'dart:math';

import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        height: 400,
        width: 300,
        child: Center(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 30.0, color: Colors.purple),
            )),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Go to Second Screen',
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: () {
        _navigateToSecondScreen(context);
      },
    );
  }
}

void _navigateToSecondScreen(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(),
      ));
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Return to First Screen',
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: () {
        _navigateToFirstScreen(context);
      },
    );
  }
}

void _navigateToFirstScreen(BuildContext context) {
  Navigator.pop(context);
}

class MyWidget extends StatefulWidget {
  @override
  _MyStateWidget createState() => _MyStateWidget();
}

class _MyStateWidget extends State<MyWidget> {
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        'Hello, World!',
        style: TextStyle(
          fontSize: 30.0,
          color: textColor,
        ),
      ),
      onTap: () {
        _doSomething();
      },
    );
  }

  void _doSomething() {
    setState(() {
      int randomHexColor = Random().nextInt(0xFFFFFF);
      int opaqueColor = 0xFF000000 + randomHexColor;
      textColor = Color(opaqueColor);
    });
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool _checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Button'),
      onPressed: () {
        _showAlertDialog();
      },
    );
  }

  void _showAlertDialog() {
    Widget continueButton = FlatButton(
      child: Text('Continue'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Alert Dialog'),
      content: Text('This is a flutter AlertDialog'),
      actions: <Widget>[
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void _doSomething(bool isChecked) {
    setState(() {
      _checkedValue = isChecked;
    });
  }
}

class FirstRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.home,
            color: Colors.green,
          ),
        ),
        Text(
          'Beams'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SecondRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 0,
      ),
      child: Text(
        'Send programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class ThirdRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Explore Beams'.toUpperCase(),
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class BeamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[900],
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FirstRow(),
          SecondRow(),
          ThirdRow(),
        ],
      ),
    );
  }
}

Widget myCustomWidgetLayout() {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.all(30.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(),
        ),
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Expanded(child: Icon(Icons.home)),
          Expanded(child: Icon(Icons.refresh)),
          Expanded(child: Icon(Icons.image)),
          Expanded(child: Icon(Icons.call)),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(18.0),
              color: Colors.green,
              child: Text('Hello Green'),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(18.0),
              color: Colors.amber,
              child: Text('Hello Amber'),
            ),
          ),
        ],
      ),
    ],
  );
}
