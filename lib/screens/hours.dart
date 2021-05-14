import 'package:flutter/material.dart';


class Hours extends StatelessWidget {
  List <String> hours = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        itemCount: hours.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () {
              Navigator.pop(context, {"number": hours[index]});
            },
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(60.0, 8.0, 60.0, 8.0),
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 30.0,
                    ),
                    SizedBox(width: 7.0,),
                    Text("${hours[index]} hours",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
