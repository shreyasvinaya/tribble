import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class rentData extends StatefulWidget {
  const rentData({Key key}) : super(key: key);

  @override
  _rentDataState createState() => _rentDataState();
}

class _rentDataState extends State<rentData>  {

  final userDataFuture = FirebaseFirestore.instance.collection("userData").get();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Previous Bookings on Tribble'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: FutureBuilder(
        future: userDataFuture,
        builder: (context,snapshot){
          if(snapshot.hasData){
            final locations = snapshot.data.docs.map((result) => result["pickupLocation"]).toList();
            final carType = snapshot.data.docs.map((result) => result["carType"]).toList();
            final time = snapshot.data.docs.map((result) => result["time"]).toList();
            final price = snapshot.data.docs.map((result) => result["price"]).toList();
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context,index){
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 700),
                    child: SlideAnimation(
                      verticalOffset: 100.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                          child: Container(
                            height: 130.0,
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5,5),
                              )],
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(locations[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(time[index],
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(carType[index],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.directions_car_rounded,
                                      size: 35.0,
                                      color: Colors.black,
                                    ),
                                    Text("${price[index]}/hr",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(context, "/confirm");
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.chevron_right,
                                            size: 27.0,
                                            color: Colors.black,
                                          ),
                                          Text("More Info",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      )
      );

  }
}
