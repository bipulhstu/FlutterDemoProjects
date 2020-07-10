import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Center(child: Text("Poor Children"),),
          backgroundColor: Colors.blueGrey[600],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.jpg')
          ),
        ),
      )
    ),
  );
}
