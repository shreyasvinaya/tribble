import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Timeselector extends StatefulWidget {
  @override
  _TimeselectorState createState() => _TimeselectorState();
}

class _TimeselectorState extends State<Timeselector> {
  String type = "Hours";
  int num1 = 2;
  int num2 = 7;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[600],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Duration",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage('assets/newmap.png'),
                        fit: BoxFit.cover
                    )
                ),
                child: AnimationLimiter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: Duration(milliseconds: 700),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: MediaQuery.of(context).size.width/2,
                          child: FadeInAnimation(child: widget),
                        ) ,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.7,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          num1 += 1;
                                        });
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: (MediaQuery.of(context).size.width-100)/2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.tealAccent,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 40.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(num2 < 23){
                                            num2 += 1;
                                          }
                                          else {
                                            num2 = 0;
                                            num1 += 1;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: (MediaQuery.of(context).size.width-100)/2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.tealAccent,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 40.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Container(
                                  height: 100.0,
                                  width: MediaQuery.of(context).size.width-30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.cyan[700].withOpacity(0.8),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("$num1 Days, $num2 hours",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 35.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(num1 > 0){
                                            num1 -= 1;
                                          }
                                          else {
                                            num1 = num1;
                                            Fluttertoast.showToast(
                                              msg: "You can't rent for less than 0 days",
                                              toastLength: Toast.LENGTH_SHORT,
                                              backgroundColor: Colors.white.withOpacity(0.8),
                                              textColor: Colors.black,
                                              gravity: ToastGravity.BOTTOM,
                                              fontSize: 16.0,
                                            );
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: (MediaQuery.of(context).size.width-100)/2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.tealAccent,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 45.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(num2 > 0){
                                            if(num1 == 0 && num2 == 1){
                                              Fluttertoast.showToast(
                                                msg:"You can't rent for less than 1 hour",
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor:
                                                Colors.white.withOpacity(0.8),
                                                textColor: Colors.black,
                                                gravity: ToastGravity.BOTTOM,
                                                fontSize: 16.0,
                                              );
                                            }
                                            else{
                                              num2 -= 1;
                                            }
                                          }
                                          else {
                                            if(num1 > 0 && num2 == 0){
                                              num1 -= 1;
                                              num2 = 23;
                                            }
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: (MediaQuery.of(context).size.width-100)/2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.tealAccent,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 45.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    size: 40.0,
                                    color: Colors.black,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Color(0xff7290AC),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/checkout', arguments: {
                                    "timeType": type,
                                    "num1": num1,
                                    "num2": num2,
                                  });
                                },
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 40.0,
                                    color: Colors.black,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Color(0xff7290AC),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0,),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}