import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:tribble/models/vehicledata.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection service
  final CollectionReference vehicleCollection =
      FirebaseFirestore.instance.collection('vehicles');

  Future updateUserData(
    String carType,
    int price,
    String pickup,
    String timeDuration,
    DateTime date,
  ) async {
    return await vehicleCollection.doc(uid).set({
      'Type': carType,
      'Price': price,
      'Pickup': pickup,
      'Duration': timeDuration,
      'Date': date,
    });
  }

  // vehicle data from snapshot
  List<vehicle> _vehicleListfromSnapshot(QuerySnapshot snapshot) {
    snapshot.docs.map((doc) {
      return vehicle(
        carType: doc.get('Type') ?? '',
        price: doc.get('Price') ?? 0,
        pickup: doc.get('Pickup') ?? '',
        timeDuration: doc.get('Duration') ?? '',
        date: doc.get('Date').toDate(),
      );
    }).toList();
  }

  // get vehicle data stream
  Stream<List<vehicle>> get vhdata {
    return vehicleCollection.snapshots().map(_vehicleListfromSnapshot);
  }
}
