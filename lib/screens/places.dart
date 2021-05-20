import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tribble/screens/places_class.dart';

class Places extends StatefulWidget {
  Places({Key key}) : super(key: key);

  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {

  GoogleMapController _controller;
  List<Marker> allDestinationMarkers = [];
  PageController _pageController;
  int prevPage;

  final List<Locations> destinations = [
    Locations(
        Name: 'Aguada Fort and Candolim',
        address: 'North Goa',
        description: 'Candolim is known for Candolim Beach and, to the north, lively Calangute Beach. In the south, the sturdy walls of Aguada Fort, built in the early 1600s under Portuguese colonial rule',
        locationCoordinates: LatLng(15.515447, 73.768402),
        thumbnail: 'Candolim.jpg'
    ),

    Locations(
        Name: 'Baga beach',
        address: 'North Goa',
        description: 'Called as "The Hometown of Nightlife," Baga beach is reputed for its cranky music celebrations by late-night, mouth-watering food, designer shops, and adventure sports.',
        locationCoordinates: LatLng(15.5553, 73.7517),
        thumbnail: 'Baga.jpg'
    ),

    Locations(
        Name: 'Vagator Beach',
        address: 'North Goa',
        description: 'Vagator beach is adorned with red cliffs that look down to two freshwater springs. It has several small stalls that sell clothes, food and an assortment of trinkets and souvenirs',
        locationCoordinates: LatLng(15.6030, 73.7336),
        thumbnail: 'Vagator.jpg'
    ),

    Locations(
        Name: 'Bogmalo Beach',
        address: 'South Goa',
        description: 'Bogmalo beach is situated in a small bay with around a mile of curving sandy beach. The beach is located about 4 kilometres from Dabolim Airport',
        locationCoordinates: LatLng(15.369722, 73.833611),
        thumbnail: 'Bogmalo.jpg'
    ),

    Locations(
        Name: 'Palolem Beach',
        address: 'South Goa',
        description: 'Palolem beach is known for its calm waters and for its nightlife, including silent discos where partygoers wear headphones. It is lined with palm trees and colorful wooden shacks',
        locationCoordinates: LatLng(15.0100, 74.0232),
        thumbnail: 'Palolem.jpg'
    ),

    Locations(
        Name: 'Margao',
        address: 'South Goa',
        description: 'Margaos Portuguese past is evident in buildings like the Baroque Holy Spirit Church. Sat Burzam Ghor is a grand 1700s mansion with 3 of its original 7 gables remaining.',
        locationCoordinates: LatLng(15.2832, 73.9862),
        thumbnail: 'Margao.jpg'
    ),

  ];

  @override
  void initState() {
    super.initState();
    destinations.forEach((element)
    {
      allDestinationMarkers.add(
          Marker(
            markerId: MarkerId(element.Name),
            draggable: false,
            infoWindow: InfoWindow( title: element.Name, snippet: element.address),
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

  _destinationsList(index) {
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
              moveCamera();
            },
            child: Stack(
                children: [
                  Center(
                      child: Container(
                          margin: EdgeInsets.symmetric( horizontal: 7.0, vertical: 20.0),
                          height: 140.0,
                          width:  290.0,
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
                                color: Colors.grey[300],
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
                                              image: AssetImage("assets/${destinations[index].thumbnail}"),
                                              fit: BoxFit.cover
                                          )
                                      )
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destinations[index].Name,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),Text(
                                        destinations[index].address,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),Container(
                                        width: 160.0,
                                        child: Text(
                                          destinations[index].description,
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
                zoom: 16,
                tilt: 20,
              ),
              markers: Set.from(allDestinationMarkers),
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
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index){
                    return _destinationsList(index);
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
        CameraPosition(
          target: destinations[_pageController.page.toInt()].locationCoordinates,
          zoom: 15,
          tilt: 15,
          bearing: 10,)
    ));
  }

}