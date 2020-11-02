import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myMarkers = HashSet<Marker>(); //collection
  BitmapDescriptor customMarker; //attribute
  List<Polyline> myPolyline = [];

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/cc2s.png');
  }

  @override
  void initState() {
    super.initState();
    getCustomMarker();
    createPloyLine();
  }

  createPloyLine() {
    myPolyline.add(
      Polyline(
          polylineId: PolylineId('1'),
          color: Colors.blue,
          width: 3,
          points: [
            LatLng(29.990000, 31.149000),
            LatLng(29.999000, 31.149900),
          ],
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ]),
    );
  }

  Set<Polygon> myPolygon() {
    var polygonCoords = List<LatLng>();
    polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
    polygonCoords.add(LatLng(37.43006265331129, -122.08832357078792));
    polygonCoords.add(LatLng(37.43006265331129, -122.08332357078792));
    polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));

    var polygonSet = Set<Polygon>();
    polygonSet.add(
      Polygon(
        polygonId: PolygonId('1'),
        points: polygonCoords,
        strokeWidth: 1,
        strokeColor: Colors.red,
      ),
    );

    return polygonSet;
  }

  Set<Circle> myCircles = Set.from([
    Circle(
      circleId: CircleId('1'),
      center: LatLng(29.990940, 31.149248),
      radius: 1000,
      strokeWidth: 1,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Google Map'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(29.990940, 31.149248), zoom: 14),
              onMapCreated: (GoogleMapController googleMapController) {
                setState(() {
                  myMarkers.add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(29.990940, 31.149248),
                      infoWindow: InfoWindow(
                          title: 'Code2Start',
                          snippet: 'Please share code2Start on social'),
                      onTap: () {
                        print('Marker tabed');
                      },
                      icon: customMarker,
                    ),
                  );
                });
              },

              /*
              markers: myMarkers,
              polygons: myPolygon(),
              
              circles: myCircles,
              */
              polylines: myPolyline.toSet(),
            ),
            Container(
              child: Image.asset('assets/images/c2s.png'),
              alignment: Alignment.topCenter,
            ),
            Container(
              child: Text(
                'Share code2start',
                style: TextStyle(fontSize: 50),
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ));
  }
}
