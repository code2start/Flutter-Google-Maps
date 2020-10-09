import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myMarkers = HashSet<Marker>(); //collection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Google Map'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 14),
              onMapCreated: (GoogleMapController googleMapController) {
                setState(() {
                  myMarkers.add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(30.0444, 31.2357),
                    ),
                  );
                });
              },
              markers: myMarkers,
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
