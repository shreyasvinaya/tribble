import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class Timetype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[600],
          title: Text("Time Type",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black
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
                    horizontalOffset: MediaQuery.of(context).size.width / 2,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.7,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, {"type": "Hours"});
                            },
                            child: Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width-200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.cyan[700].withOpacity(0.8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Hours",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0,),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, {"type": "Days"});
                            },
                            child: Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width-200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.cyan[700].withOpacity(0.8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Days",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 130.0,),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
