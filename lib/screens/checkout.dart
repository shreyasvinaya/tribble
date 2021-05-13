import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width-30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.amber,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.where_to_vote_sharp,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8.0,),
                    Text("BITS Goa",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: Row(
                children: [
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width/2-15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.tealAccent,
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width/2-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.teal,
                    ),
                  ),
                  // SizedBox(width: 15.0,),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width-30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.lightBlue,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width-30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.cyanAccent,
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Row(
                children: [
                  Container(
                    height: 90.0,
                    width: MediaQuery.of(context).size.width/2-115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 90.0,
                    width: MediaQuery.of(context).size.width/2+70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
