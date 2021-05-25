import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class rentData extends StatefulWidget {
  const rentData({Key key}) : super(key: key);

  @override
  _rentDataState createState() => _rentDataState();
}

class _rentDataState extends State<rentData>  {

  List locations  = [FirebaseFirestore.instance.collection("userData").get().then((querySnapshot) {
  querySnapshot.docs.forEach((result) async { return await result["pickupLocation"]; });
  }) as String];

  List<String>prices = [FirebaseFirestore.instance.collection("userData").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) { return result["price"]; });
  }) as String];

  List<String>carTypes = [FirebaseFirestore.instance.collection("userData").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) { return result["carType"]; });
  }) as String];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Text(locations[index]),
          );
        },
        )
      );

  }
}


printCards() {

  FirebaseFirestore.instance.collection("userData").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(result["carType"]),
            Text(result["price"]),
          ],
        ),
      );
    });
  });

}