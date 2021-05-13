import 'package:flutter/material.dart';


class Car{
  String type,price,image;
  Car({this.type,this.price,this.image});
}
class Carselector extends StatelessWidget {
  @override
  List<Car> cars = [
    Car(type: "Standard", price: "200", image: "standard.png"),
    Car(type: "MiniVan", price: "300", image: "minivan.png"),
    Car(type: "SUV", price: "400", image: "suv.png"),
    Car(type: "Luxury", price: "700", image: "luxury.png"),
    Car(type: "Sports", price: "1000", image: "sports.png"),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton.icon(onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      color: Colors.grey[900],
                      icon: Icon(
                        Icons.add_location_sharp,
                        size: 27.0,
                        color: Colors.orange,
                      ),
                      label: Column(
                        children: [
                          Text("BITS Goa",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              color: Colors.white70,
                            ),
                          ),
                          Text("\tChange Location!",
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          SizedBox(height: 5.0,),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 8.0, 0.0),
                    child: IconButton(icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30.0,
                    ),
                        onPressed: () {}
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage('assets/map.jpg'),
                        fit: BoxFit.cover
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/dragon.jpg"),
                            radius: 25.0,
                          ),
                        ],
                      ),
                      Container(
                        height: 250.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cars.length,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: () {
                                  print("${cars[index].type}");
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 17.0, 17.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Positioned(
                                        bottom: 10.0,
                                        child: Container(
                                          height: 120.0,
                                          width: 150.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(13.0,10.0),
                                              ),
                                            ],
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${cars[index].type}",
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    letterSpacing: 1.5,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Text("₹${cars[index].price}/hr",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.greenAccent[700]
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
                                        image: AssetImage('assets/${cars[index].image}'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
