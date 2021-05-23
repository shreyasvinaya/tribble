import 'package:flutter/material.dart';
import 'package:tribble/models/vehicledata.dart';

class vhtile extends StatelessWidget {
  final vehicle vh1;

  vhtile({this.vh1});
  // var date = vh1.date.toString();
  // var dateParse = DateTime.parse(date);
  // var formattedDate = "${dateParse.day}/${dateParse.month}/${dateParse.year}";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Text(vh1.carType),
          subtitle:
              Text('Picked up at ${vh1.pickup} on ${vh1.date.toString()}}'),
        ),
      ),
    );
  }
}
