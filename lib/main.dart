import 'package:flutter/material.dart';
import 'package:tribble/screens/carselector.dart';
import 'package:tribble/screens/checkout.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Carselector(),
      "/checkout": (context) => Checkout(),
    },
  ));
}

