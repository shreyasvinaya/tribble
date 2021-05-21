import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Checkout extends StatelessWidget {
  Map dataReceived = {};
  @override
  Widget build(BuildContext context) {
    dataReceived = ModalRoute.of(context).settings.arguments;
    int num = int.parse(dataReceived["number"]);
    int perhr = int.parse(GlobalConfiguration().get("price"));
    int cost;
    if(dataReceived["timeType"] == "Hours"){
      cost = perhr*num;
    }
    else{
      cost = perhr*num*24;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/checkout.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 7.0,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width-30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xff082932).withOpacity(0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.where_to_vote_sharp,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0,),
                      Text("${GlobalConfiguration().get("location")}",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width/2-15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.teal[600].withOpacity(0.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 35.0,
                          ),
                          SizedBox(width: 5.0,),
                          Text("${dataReceived["number"]} ${dataReceived["timeType"]}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width/2-20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.teal[600].withOpacity(0.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("₹",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Text("$cost",
                            style:TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xff082932).withOpacity(0.7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        height: 130.0,
                        width: 200.0,
                        image: AssetImage('assets/${GlobalConfiguration().get("image")}'),
                      ),
                      // SizedBox(width: 40.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${GlobalConfiguration().get("type")}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 25.0,),
                          Text("₹ ${GlobalConfiguration().get("price")}/hr",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/goaDest');
                  },
                  child: Container(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width-30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xff0B1F42).withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Top places to visit in Goa",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          ),
                          Text("Tap to know more",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 170.0,
                            width: 400.0,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 150,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 2),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: ['Baga.jpg', 'Bogmalo.jpg', 'Candolim.jpg', 'Margao.jpg', 'Palolem.jpg', 'Vagator.jpg'].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          image: DecorationImage(
                                            image: AssetImage('assets/$i'),
                                            fit: BoxFit.fill
                                          ),
                                        ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          )
                          // SizedBox(width: 15.0,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width/2-115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 35.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Container(
                      height: 90.0,
                      width: MediaQuery.of(context).size.width/2+70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.black,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Rent now",
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.0,)
            ],
          ),
        ),
      ),
    );
  }
}
