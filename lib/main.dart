import 'package:flutter/material.dart';
import 'package:tribble/screens/places.dart';
import 'package:tribble/screens/shoplocations.dart';
import 'package:tribble/screens/carselector.dart';
import 'package:tribble/screens/checkout.dart';
import 'package:tribble/screens/timeselector.dart';
import 'package:tribble/screens/timetype.dart';
import 'package:tribble/screens/hours.dart';
import 'package:tribble/screens/days.dart';
import 'package:global_configuration/global_configuration.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("config");
  runApp(MaterialApp(
    routes: {
      "/": (context) => MyHomePage(),
      "/carselect": (context) => Carselector(),
      "/checkout": (context) => Checkout(),
      "/timeselect": (context) => Timeselector(),
      "/timetype": (context) => Timetype(),
      "/hours": (context) => Hours(),
      "/days": (context) => Days(),
      // "/goaDest": (context) => Places(),
    },
  ));
}

