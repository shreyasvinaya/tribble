import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tribble/screens/pickup_locations.dart';
import 'package:flutter/services.dart';
import 'package:tribble/services/auth_service.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tribble/blocs/auth_bloc.dart';
import 'package:tribble/screens/login.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController _controller;
  final authService = AuthService();
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;
  int num = 1;
  StreamSubscription<User> loginStateSubscription;

  final List<Locations> pickupLocations = [
    Locations(
        shopName: 'GoiCar - Car Rentals',
        address: 'North Goa',
        description:
            'F1, First Floor, El-Capitan Centre, Mapusa,  Goa 403507\nPhone: 9860122226',
        locationCoordinates: LatLng(15.5935975612, 73.8138878345),
        thumbnail: 'GoiCar.png'),
    Locations(
        shopName: 'Joes Car Rental Goa',
        address: 'South Goa',
        description:
            'Casa Royale, Shop No 5,Near Dabolim Airport, Goa, Dabolim, Goa 403711',
        locationCoordinates: LatLng(15.39308, 73.81816),
        thumbnail: 'joescar.jpg'),
    Locations(
        shopName: 'Lucky Ali Car Hire Service',
        address: 'South Goa',
        description:
            'Dabolim Airport, Vasco da Gama, Goa 403802. Phone- 9730764818',
        locationCoordinates: LatLng(15.3899, 73.8253),
        thumbnail: 'LuckyAli.jpg'),
    Locations(
        shopName: 'Car4Hires',
        address: 'South Goa',
        description:
            'Zuari Road, Maimollem, Mormugao, Goa, 403802. Phone- 7528904589',
        locationCoordinates: LatLng(15.387616630175167, 73.82024343518475),
        thumbnail: 'Car4Hire.png'),
    Locations(
        shopName: 'Comfort Car Rental',
        address: 'South Goa',
        description:
            'Umiya Quatro - D, Office No. 25, Upper, Green Valley, Dabolim, Goa 403801. Phone- 9823086404',
        locationCoordinates: LatLng(15.387357158054131, 73.84500889791742),
        thumbnail: 'ComfortRental.png'),
    Locations(
        shopName: 'Vailankanni Auto Hires',
        address: 'North Goa',
        description:
            'St Joseph Apts, A-5, Camotim Vaddo, Candolim, Goa 403515. Phone- 9822101598',
        locationCoordinates: LatLng(15.521544407569099, 73.76700327815014),
        thumbnail: 'Vailankanni.png'),
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
    super.initState();
    pickupLocations.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoordinates));
    });
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(scrollListener);
  }

  void scrollListener() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _pickupLocationsList(index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 300,
              width: Curves.easeInOut.transform(value) * 350,
              child: widget,
            ),
          );
        },
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/carselect',
                  arguments: pickupLocations[index].locationCoordinates);
              GlobalConfiguration()
                  .updateValue('location', pickupLocations[index].shopName);
            },
            child: Stack(children: [
              Center(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
                      height: 140.0,
                      width: 290.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 2.0),
                              blurRadius: 10.0,
                            ),
                          ]),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 120.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/${pickupLocations[index].thumbnail}"),
                                          fit: BoxFit.contain))),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pickupLocations[index].shopName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    pickupLocations[index].address,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 160.0,
                                    child: Text(
                                      pickupLocations[index].description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))))
            ])));
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[400]),
              child: StreamBuilder<User>(
                  stream: authBloc.currentUser,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    print(snapshot.data.photoURL);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data.displayName,
                            style: TextStyle(fontSize: 25.0)),
                        SizedBox(
                          height: 7.0,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data.photoURL.replaceFirst('s96', 's400')),
                          radius: 40.0,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(snapshot.data.email,
                            style: TextStyle(fontSize: 10.0)),
                      ],
                    );
                  }),
            ),
            ListTile(
              leading: Icon(Icons.directions_car_rounded),
              title: Text('My Bookings'),
              onTap: () {
                Navigator.pushNamed(context, '/rentData');
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
                title: Text('Toggle Map Theme'),
                leading: Icon(Icons.map),
                onTap: () {
                  Navigator.pop(context);
                  String map_type = "night";
                  if(num%2 == 0){
                    map_type = "night";
                  }
                  else{
                    map_type = "retro";
                  }
                  setState(() {
                    num += 1;
                    getJson('assets/map_styles/$map_type.json').then(setMapStyle);
                  });
                }
              ),
              Divider(thickness: 1,),
              ListTile(
                leading: Icon(Icons.airplanemode_active),
                title: Text('Book a Flight'),
                onTap: () {
                  Navigator.pushNamed(context, '/confirm');
                },
              ),
              Divider(thickness: 1,),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),
                onTap: () {
                  authService.logout();
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          )),
          body:
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(15.3911, 73.8782),
                    zoom: 15,
                    tilt: 20,
                  ),
                  markers: Set.from(allMarkers),
                  onMapCreated: mapCreated,
                ),
              ),

              Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width-60.0,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext) => _buildPopupDialogue(context)
                    );
                  },
                  child: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[400],
                      border: Border.all(width: 1)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.info_outline_rounded)
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom : 0.0,
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                        controller : _pageController,
                        itemCount: pickupLocations.length,
                        itemBuilder: (BuildContext context, int index){
                          return _pickupLocationsList(index);
                        }
                    ),
                  ),
                ),

              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                      border: Border.all(width: 1)
                  ),
                    child: IconButton(icon: Icon(Icons.menu), iconSize: 30, onPressed: () => _scaffoldKey.currentState.openDrawer())
                ),
              ),
            ],
          ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
    getJson('assets/map_styles/night.json').then(setMapStyle);
  }

  Future<String> getJson(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: pickupLocations[_pageController.page.toInt()].locationCoordinates,
      zoom: 16,
      tilt: 45,
      bearing: 30,
    )));
  }

  Widget _buildPopupDialogue(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[800],
      title: Center(
          child: Text(
        'Welcome to Tribble!',
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w900),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "\nWe are a Car Rental app focused around BITS Goa. \n\n"
            "This page enables you to choose the pickup location of your car from the options provided at the bottom of your screen \n\n"
            "We will be adding more locations soon!",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
