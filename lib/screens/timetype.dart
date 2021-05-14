import 'package:flutter/material.dart';


class Timetype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Time Type",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.end,
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
                    width: MediaQuery.of(context).size.width-230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[800],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Hours",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          letterSpacing: 1.5,
                          color: Colors.white70,
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
                    width: MediaQuery.of(context).size.width-230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[800],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Days",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        letterSpacing: 1.5,
                        color: Colors.white70,
                      ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 50.0,),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       height: 80.0,
          //       width: 80.0,
          //       child: Icon(
          //         Icons.arrow_back_rounded,
          //         size: 40.0,
          //         color: Colors.black,
          //       ),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25.0),
          //         color: Colors.cyanAccent,
          //       ),
          //     ),
          //     Container(
          //       height: 80.0,
          //       width: MediaQuery.of(context).size.width*0.7,
          //     ),
          //   ],
          // ),
          // SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}
