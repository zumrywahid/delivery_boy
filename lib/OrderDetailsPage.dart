import 'dart:async';
import 'dart:math' as math;
import 'package:delivery_boy/AppUtil.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller = Completer();

  var maptype = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              child: GoogleMap(
                mapType: maptype,
                initialCameraPosition: _kGooglePlex,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              // child: Container(
              //   color: Colors.green,
              // ),
            ),
            Positioned(
              height: 250,
              width: MediaQuery.of(context).size.width,
              bottom: 40,
              child: PageView(
                children: [
                  orderItemWidget(0),
                  orderItemWidget(1),
                  orderItemWidget(2),
                  orderItemWidget(3),
                ],
                pageSnapping: true,
                controller: PageController(
                  viewportFraction: 0.9,
                  initialPage: 0,
                ),
              )
            ),
            Positioned(
              top: 45,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: color1,
                  ),
                  width: 40,
                  height: 40,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black38),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderItemWidget(int index) {
    Order order = orders[index];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      color: (index % 2 == 0) ? Colors.white : Color(0xFFE1DDDD),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Center(
            child: Container(
              width: 30,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          MaterialButton(
            color: color1,
            child: Text("2 Pickups left"),
            onPressed: () {},
            height: 30,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: color1,
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_on, color: Colors.white,size: 20),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 45,
                    child: Text(order.address,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Tajawal'
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Time",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                          fontFamily: 'Tajawal'
                      )
                  ),
                  const SizedBox(height: 8,),
                  Text(order.time,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Tajawal'
                      )
                  )
                ],
              ),
              SizedBox(width: 20,),
              Container(
                width: 0.5,
                height: 50,
                color: Colors.black54,
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Pickup points",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                          fontFamily: 'Tajawal'
                      )
                  ),
                  const SizedBox(height: 8,),
                  Text("${order.pickPoints}",
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Tajawal'
                      )
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
                onPressed: () {
                  print('Pressed');
                },
                child: const Text("Contact", style: TextStyle(
                  color: Colors.white
                ),),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: color1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
                onPressed: () {
                  print('Pressed');
                },
                child: const Text("Contact", style: TextStyle(
                  color: Colors.black
                ),),
              ),

            ],
          )
        ],
      ),
    );
  }
}

//