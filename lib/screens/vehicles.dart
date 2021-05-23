import 'package:flutter/material.dart';
import 'package:tribble/home/vh_tile.dart';
import 'package:tribble/models/vehicledata.dart';
import 'package:provider/provider.dart';

class vehicles extends StatefulWidget {
  @override
  _vehiclesState createState() => _vehiclesState();
}

class _vehiclesState extends State<vehicles> {
  @override
  Widget build(BuildContext context) {
    final vhdata = Provider.of<List<vehicle>>(context);

    return ListView.builder(
      itemCount: vhdata.length,
      itemBuilder: (context, index) {
        return vhtile(vh1: vhdata[index]);
      },
    );
  }
}
