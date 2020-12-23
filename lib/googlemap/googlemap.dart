import 'dart:math';

import 'package:driverapp/DirectionProvider.dart';
import 'package:driverapp/googlemap/alertbox.dart';
import 'package:driverapp/googlemap/maps_sheet.dart';
import 'package:driverapp/googlemap/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';

class GooglMap extends StatefulWidget {
  // GooglMap({Key key, this.title}) : super(key: key);

  // final String title;
  final LatLng fromPoint = LatLng(55.9195845, -3.2663127);
  final LatLng toPoint = LatLng(51.509865, -0.118092);

  @override
  _GooglMapState createState() => _GooglMapState();
}

class _GooglMapState extends State<GooglMap> {
  double destinationLatitude = 17.439930;
  double destinationLongitude = 78.498276;
  String destinationTitle = 'Ocean Beach';

  double originLatitude = 17.3687826;
  double originLongitude = 78.52467060000004;
  String originTitle = 'Pier 33';
  DirectionsMode directionsMode = DirectionsMode.driving;
  // GoogleMapController _controller;

  // final CameraPosition _initialPosition =
  //     CameraPosition(target: LatLng(55.9195845, -3.2663127));

  // final List<Marker> markers = [];

  // addMarker(cordinate) {
  //   int id = Random().nextInt(100);

  //   setState(() {
  //     markers
  //         .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
  //   });
  // }
  GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffec280e),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 80,
            ),
            Text(
              'Madhu Test',
              style: TextStyle(
                  color: Colors.white, fontSize: 17, letterSpacing: 1),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // GoogleMap(
          //   initialCameraPosition: _initialPosition,
          //   mapType: MapType.normal,
          //   onMapCreated: (controller) {
          //     setState(() {
          //       _controller = controller;
          //     });
          //   },
          //   markers: markers.toSet(),
          //   onTap: (cordinate) {
          //     _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          //     addMarker(cordinate);
          //   },
          // ),
          Consumer<DirectionProvider>(
            builder:
                (BuildContext context, DirectionProvider api, Widget child) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: widget.fromPoint,
                  zoom: 12,
                ),
                markers: _createMarkers(),
                polylines: api.currentRoute,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            },
          ),

          Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffec280e),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Color(0xffec280e)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: InkWell(
                              //            onTap: () {
                              //   Navigator.of(context).push(new MaterialPageRoute(
                              //     builder: (BuildContext context) => new Home(),
                              //   ));
                              // },
                              onTap: () {
                                MapsSheet.show(
                                  context: context,
                                  onMapTap: (map) {
                                    map.showDirections(
                                      destination: Coords(
                                        destinationLatitude,
                                        destinationLongitude,
                                      ),
                                      destinationTitle: destinationTitle,
                                      origin: originLatitude == null ||
                                              originLongitude == null
                                          ? null
                                          : Coords(
                                              originLatitude, originLongitude),
                                      originTitle: originTitle,
                                      // waypoints: waypoints,
                                      directionsMode: directionsMode,
                                    );
                                  },
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.navigation,
                                          color: Colors.white, size: 20),
                                    ),
                                    TextSpan(
                                        text: "    NAVIGATE ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 10, bottom: 20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      color: Color(0xff0173a5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Name ",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                WidgetSpan(
                                  child: Container(
                                    width: 30,
                                  ),
                                ),
                                TextSpan(
                                  text: ":  hrasha",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Phone",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                WidgetSpan(
                                  child: Container(
                                    width: 30,
                                  ),
                                ),
                                TextSpan(
                                  text: ":  9876543210",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Address",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                WidgetSpan(
                                  child: Container(
                                    width: 22,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ":  Broomhail Graden, Corstorphine, Edinburgh EH12 7QD, UK",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xff3a3a3a),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(40)),
                                      elevation: 16,
                                      child: Container(
                                        // transform: Matrix4.translationValues(0.0, -90.0, 0.0),
                                        //height: 450,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // width: double.infinity,
                                        child: OrderDetail(),
                                      ),
                                    );
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 27,
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'ITEMS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.white,
                              // thickness: 5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'PHONE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.white,
                              // thickness: 5,
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 27,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'TIMER',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                          Container(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.white,
                              // thickness: 5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              asyncConfirmDialog(context);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.credit_card_outlined,
                                  color: Colors.white,
                                  size: 27,
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'DELIVERED',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.white,
                              // thickness: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     _controller.animateCamera(CameraUpdate.zoomOut());
      //   },
      //   child: Icon(Icons.zoom_out),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(
      Marker(
        markerId: MarkerId("fromPoint"),
        position: widget.fromPoint,
        infoWindow: InfoWindow(title: "Pizzeria"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("toPoint"),
        position: widget.toPoint,
        infoWindow: InfoWindow(title: "Roca 123"),
      ),
    );
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    _centerView();
  }

  _centerView() async {
    var api = Provider.of<DirectionProvider>(context);

    await _mapController.getVisibleRegion();

    print("buscando direcciones");
    await api.findDirections(widget.fromPoint, widget.toPoint);

    var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);

    api.currentRoute.first.points.forEach((point) {
      left = min(left, point.latitude);
      right = max(right, point.latitude);
      top = max(top, point.longitude);
      bottom = min(bottom, point.longitude);
    });

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );
    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }
}
