import 'package:flutter/material.dart';
import 'package:tribble/screens/shoplocations.dart';
import 'package:tribble/screens/carselector.dart';
import 'package:tribble/screens/checkout.dart';
import 'package:tribble/screens/timeselector.dart';
import 'package:tribble/screens/timetype.dart';
import 'package:tribble/screens/hours.dart';
import 'package:tribble/screens/days.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tribble/blocs/auth_bloc.dart';
import 'package:tribble/screens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("config");
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      "/login": (context) => LoginScreen(),
      "/": (context) => MyHomePage(),
      "/carselect": (context) => Carselector(),
      "/checkout": (context) => Checkout(),
      "/timeselect": (context) => Timeselector(),
      "/timetype": (context) => Timetype(),
      "/hours": (context) => Hours(),
      "/days": (context) => Days(),
    },
  ));
}

class MaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Tribble Login',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
