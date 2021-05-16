import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tribble/screens/pickup_locations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;

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
    _pageController = PageController(initialPage:1, viewportFraction: 0.8)..addListener(scrollListener);
  }

  void scrollListener() {
    if(_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _pickupLocationsList(index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if(_pageController.position.haveDimensions){
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.3) + 0.06 ).clamp(0.0, 1.0);
          }
          return Center(
            child : SizedBox(
              height: Curves.easeInOut.transform(value) * 300,
              width: Curves.easeInOut.transform(value) * 350,
              child: widget,
            ),
          );
        },
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/carselect');
            },
            child: Stack(
                children: [
                  Center(
                      child: Container(
                          margin: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0),
                          height: 125.0,
                          width:  275.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(1.0, 2.0),
                                  blurRadius: 10.0,
                                ),
                              ]
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Row(
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
                                              image: NetworkImage(
                                                  pickupLocations[index].thumbnail
                                              ),
                                              fit: BoxFit.cover
                                          )
                                      )
                                  ),
                                  SizedBox(width: 10.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pickupLocations[index].shopName,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),Text(
                                        pickupLocations[index].address,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),Container(
                                        width: 160.0,
                                        child: Text(
                                          pickupLocations[index].description,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          )
                      )
                  )
                ]
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
        ],
      ),

    );

  }
  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }
  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: pickupLocations[_pageController.page.toInt()].locationCoordinates,
          zoom: 16,
          tilt: 45,
          bearing: 30,)
    ));
  }

}
