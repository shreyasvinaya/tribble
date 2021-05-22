import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class Timeselector extends StatefulWidget {
  @override
  _TimeselectorState createState() => _TimeselectorState();
}

class _TimeselectorState extends State<Timeselector> {
  String type = "Hours";
  int num = 7;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[600],
          title: Text("Time Duration",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/newmap.png'),
                  fit: BoxFit.cover
              )
          ),
          child: AnimationLimiter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 375),
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
                          InkWell(
                            onTap: () async{
                              dynamic result = await Navigator.pushNamed(context, '/timetype');
                              setState(() {
                                type = result['type'];
                              });
                            },
                            child: Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width-210,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.cyan[700].withOpacity(0.8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 10.0,),
                                  Text("$type",
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Colors.white,
                                    size: 51.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  if(num > 1){
                                    num -= 1;
                                  }
                                  else {
                                    num = num;
                                  }
                                });
                              },
                                backgroundColor: Colors.greenAccent,
                                elevation: 0.0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                              SizedBox(width: 15.0,),
                              Container(
                                height: 80.0,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.cyan[700].withOpacity(0.8),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("$num",
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.0,),
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  num += 1;
                                });
                              },
                                backgroundColor: Colors.greenAccent,
                                elevation: 0.0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40.0,
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
                              "number": num,
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
    );
  }
}
