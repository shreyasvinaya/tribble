import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tribble/screens/pickup_locations.dart';
import 'package:tribble/screens/shoplocations.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => MyHomePage(),
    },
  ));
}
