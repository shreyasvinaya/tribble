import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:tribble/blocs/auth_bloc.dart';
import 'package:tribble/screens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class HomeRoute extends StatelessWidget {
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
