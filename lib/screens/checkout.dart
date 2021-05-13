import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  Map dataReceived = {};
  @override
  Widget build(BuildContext context) {
    dataReceived = ModalRoute.of(context).settings.arguments;
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
                  borderRadius: BorderRadius.circular(20.0),
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
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.tealAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 35.0,
                        ),
                        SizedBox(width: 5.0,),
                        Text("24 min",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width/2-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("₹",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        SizedBox(width: 5.0,),
                        Text("200",
                        style:TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      ],
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
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightBlue,
                ),
                child: Row(
                  children: [
                    Image(
                      height: 130.0,
                      width: 200.0,
                      image: AssetImage('assets/${dataReceived["image"]}'),
                    ),
                    SizedBox(width: 50.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${dataReceived["type"]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                        ),
                        SizedBox(height: 30.0,),
                        Text("₹ ${dataReceived["price"]}",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600
                        ),
                        )
                      ],
                    ),
                  ],
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
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
                  child: Row(
                    children: [
                      Text("Top places to\nvisit in Goa",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      SizedBox(width: 15.0,),
                      Container(
                        height: 130.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('assets/map.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 90.0,
                      width: MediaQuery.of(context).size.width/2-115,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 35.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 90.0,
                    width: MediaQuery.of(context).size.width/2+70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Rent now",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
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
