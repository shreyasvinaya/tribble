import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locations {
  String shopName;
  String address;
  String description;
  String thumbnail;
  LatLng locationCoordinates;

  Locations({
    this.shopName,
    this.address,
    this.description,
    this.locationCoordinates,
    this.thumbnail
});

}