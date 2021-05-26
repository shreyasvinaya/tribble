import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tribble/blocs/auth_bloc.dart';
import 'package:tribble/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tribble/services/auth_service.dart';


class Car {
  String type, price, image;
  Car({this.type, this.price, this.image});
}

class HomeScreen extends StatefulWidget {
  @override
  Carselector createState() => Carselector();
}

class Carselector extends State<HomeScreen> {
  StreamSubscription<User> loginStateSubscription;
  GoogleMapController _controller;
  int num = 1;
  final authService = AuthService();

  @override
  void initState() {
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
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  List<Car> cars = [
    Car(type: "Bike", price: "69", image: "bike.png"),
    Car(type: "Sedan", price: "150", image: "standard.png"),
    Car(type: "MiniVan", price: "420", image: "minivan.png"),
    Car(type: "SUV", price: "300", image: "suv.png"),
    Car(type: "Luxury", price: "700", image: "luxury.png"),
    Car(type: "Sports", price: "600", image: "sports.png"),
  ];

  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    LatLng coordinates = ModalRoute
        .of(context)
        .settings
        .arguments;
    Set<Marker> _createMarker() {
      return {
        Marker(
          markerId: MarkerId("marker"),
          position: LatLng(coordinates.latitude, coordinates.longitude),
          infoWindow: InfoWindow(title: 'Your Pickup Location'),
        ),
      };
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            print(snapshot.data.photoURL);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: FlatButton.icon(onPressed: () {
                    Navigator.pop(context);
                  },
                      height: 50.0,
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      color: Colors.grey[800],
                      icon: Icon(
                        Icons.add_location_sharp,
                        size: 27.0,
                        color: Colors.orange,
                      ),
                      label: Column(
                        children: [
                          Text("${GlobalConfiguration().get("location")}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              color: Colors.white70,
                            ),
                          ),
                          Text("\tChange Location!",
                            style: TextStyle(
                                color: Colors.white,
                              letterSpacing: 0.5,
                            ),),
                          SizedBox(height: 5.0,),
                        ],
                      )),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              coordinates.latitude, coordinates.longitude),
                          zoom: 14,
                          tilt: 30,
                          bearing: 20,
                        ),
                        markers: _createMarker(),
                        onMapCreated: mapCreated,
                      ),
                      Positioned(
                        top: 10.0,
                        left: MediaQuery.of(context).size.width-70.0,
                        child: InkWell(
                          onTap: () {
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
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[400],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Switch\nTheme",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  letterSpacing: 0.5
                                ),),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    authService.logout();
                                    Navigator.pushNamed(context, '/login');
                                  },
                                    child: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data.photoURL
                                        .replaceFirst('s96', 's400')),
                                    radius: 25.0,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 250.0,
                              child: AnimationLimiter(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cars.length,
                                    itemBuilder: (context, index) {
                                      return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: Duration(milliseconds: 700),
                                        child: SlideAnimation(
                                          horizontalOffset: MediaQuery.of(context).size.width/2,
                                          child: FadeInAnimation(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/timeselect');
                                                GlobalConfiguration().updateValue(
                                                    "type", cars[index].type);
                                                GlobalConfiguration().updateValue(
                                                    "price", cars[index].price);
                                                GlobalConfiguration().updateValue(
                                                    "image", cars[index].image);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 17.0, 17.0),
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      15.0),
                                                  color: Colors.greenAccent[100],
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    Positioned(
                                                      bottom: 10.0,
                                                      child: Container(
                                                        height: 100.0,
                                                        width: 150.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(20.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(7.0, 7.0),
                                                            ),
                                                          ],
                                                          color: Colors.amber[200],
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.fromLTRB(
                                                              30.0, 20.0, 0.0, 0.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text("${cars[index]
                                                                  .type}",
                                                                style: TextStyle(
                                                                  fontSize: 20.0,
                                                                  letterSpacing: 1.5,
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color: Colors.grey[800]
                                                                ),
                                                              ),
                                                              SizedBox(height: 15.0,),
                                                              Text("₹${cars[index]
                                                                  .price}/hr",
                                                                style: TextStyle(
                                                                    fontSize: 22.0,
                                                                    letterSpacing: 1.0,
                                                                    fontWeight: FontWeight
                                                                        .w600,
                                                                    color: Colors.grey[600]
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Image(
                                                      height: 110.0,
                                                      width: 200.0,
                                                      image: AssetImage(
                                                          'assets/${cars[index]
                                                              .image}'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  void mapCreated(controller){
    setState(() {
      _controller = controller;
      getJson('assets/map_styles/night.json').then(setMapStyle);
    });
  }
  Future<String> getJson(String path) async{
    return await rootBundle.loadString(path);
  }
  void setMapStyle(String mapStyle){
    _controller.setMapStyle(mapStyle);
  }

}
