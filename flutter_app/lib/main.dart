import 'package:flutter/material.dart';

import 'package:flutterapp/location_detail.dart';
import 'package:flutterapp/models/location.dart';
import 'package:flutterapp/mocks/mock_location.dart';

void main() {
  final Location mockLocation = MockLocation.fetchAny();

  runApp(MaterialApp(home: LocationDetail(mockLocation)));
}
