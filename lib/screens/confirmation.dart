import 'package:flutter/material.dart';
import 'package:tribble/services/database.dart';
import 'package:provider/provider.dart';
import 'package:tribble/screens/vehicles.dart';
import 'package:tribble/models/vehicledata.dart';

class Confirm extends StatefulWidget {
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  Map dataReceived = {};

  @override
  // Widget build(BuildContext context) {
  //   dataReceived = ModalRoute.of(context).settings.arguments;
  //   return Scaffold(
  //     body: Center(
  //       child: Text(
  //           "Your order has been confirmed\nCar Type: ${dataReceived["carType"]}\nPrice: ${dataReceived["price"]}\nPickUp Location: ${dataReceived["pickup"]}\nTime Duration: ${dataReceived["timeDuration"]}\nDate of Booking: ${dataReceived["date"]}"),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return StreamProvider<List<vehicle>>.value(
      value: DatabaseService().vhdata,
      initialData: [],
      child: Scaffold(
        body: vehicles(),
      ),
    );
  }
}
