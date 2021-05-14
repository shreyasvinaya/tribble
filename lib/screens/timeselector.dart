import 'package:flutter/material.dart';


class Timeselector extends StatefulWidget {
  @override
  _TimeselectorState createState() => _TimeselectorState();
}

class _TimeselectorState extends State<Timeselector> {
  String type = "Hours";
  String num = "7";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Time Duration",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            // color: Colors.white,
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
                    width: MediaQuery.of(context).size.width-250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[800],
                    ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10.0,),
                      Text("$type",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white70,
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
                InkWell(
                  onTap: () async{
                    String something = '/days';
                    if(type == "Hours"){
                      something = '/hours';
                    }
                    dynamic result = await Navigator.pushNamed(context, something);
                    setState(() {
                      num = result["number"];
                    });
                  },
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width-250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[800],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0,),
                        Text("$num",
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                          size: 55.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width*0.7,
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
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}
