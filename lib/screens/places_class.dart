import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locations {
  String Name;
  String address;
  String description;
  String thumbnail;
  LatLng locationCoordinates;

  Locations({
    this.Name,
    this.address,
    this.description,
    this.locationCoordinates,
    this.thumbnail
  });

}