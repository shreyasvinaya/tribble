import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tribble/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        Navigator.pushReplacementNamed(context, '/pickup');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 130.0,
            width: MediaQuery.of(context).size.width-80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.white, width: 2.0),
              color: Color(0xff000409),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  height: 104.0,
                  width: 110.0,
                  image: AssetImage("assets/logo.png"),
                ),
                Text("Tribble",
                style: TextStyle(
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
                )
              ],
            ),
          ),
          SizedBox(height: 7.0,),
          Text("One Touch Car Rental",
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xffCCE30F),
            letterSpacing: 1.5,
          ),
          ),
         InkWell(
           onTap: () => authBloc.loginGoogle(),
           child: Padding(
             padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
             child: Container(
               height: 50.0,
               width: 250.0,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 color: Colors.white,
               ),
               child: Row(
                 children: [
                   Image(
                     height: 33.0,
                     width: 70.0,
                     image: AssetImage("assets/google.jpg"),
                   ),
                   Text("Sign up with Google",
                     style: TextStyle(
                       fontSize: 16.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.grey,
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
        ],
      ),
    ));
  }
}
