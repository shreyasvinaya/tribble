import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tribble/pages/pickup_locations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GoogleMapController _controller;
  List<Marker> allMarkers = [];

  final List<Locations> pickupLocations = [

    Locations(
        shopName: 'Shop 1',
        address: 'goa',
        description: 'shop no 1',
        locationCoordinates: LatLng(15.480, 73.880),
        thumbnail: 'https://www.revv.co.in/assets/RentalImages/HomeScreen/heroCarousel/ST_Desktop_1_FG.webp'
    ),

    Locations(
        shopName: 'Shop 2',
        address: 'goa',
        description: 'shop no 2',
        locationCoordinates: LatLng(15.4840, 73.8480),
        thumbnail: 'https://www.revv.co.in/assets/RentalImages/HomeScreen/heroCarousel/ST_Desktop_1_FG.webp'
    ),

    Locations(
        shopName: 'Shop 3',
        address: 'goa',
        description: 'shop no 3',
        locationCoordinates: LatLng(15.460, 73.860),
        thumbnail: 'https://www.revv.co.in/assets/RentalImages/HomeScreen/heroCarousel/ST_Desktop_1_FG.webp'
    ),

    Locations(
        shopName: 'Shop 4',
        address: 'goa',
        description: 'shop no 4',
        locationCoordinates: LatLng(15.470, 73.870),
        thumbnail: 'https://www.revv.co.in/assets/RentalImages/HomeScreen/heroCarousel/ST_Desktop_1_FG.webp'
    ),

    Locations(
        shopName: 'Shop 5',
        address: 'goa',
        description: 'shop no 5',
        locationCoordinates: LatLng(15.484, 73.885),
        thumbnail: 'https://www.revv.co.in/assets/RentalImages/HomeScreen/heroCarousel/ST_Desktop_1_FG.webp'
    ),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickupLocations.forEach((element)
      {
        allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow: InfoWindow( title: element.shopName, snippet: element.address),
          position: element.locationCoordinates
        ));
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-20,
            width: MediaQuery.of(context).size.width,

            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(15.4, 73.8),
                zoom: 13,
                tilt: 20,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
        ],
      ),

    );

  }
  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }

}
