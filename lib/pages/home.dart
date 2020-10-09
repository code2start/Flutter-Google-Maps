import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(37.43296265331129, -122.08832357078792), zoom: 19),
      ),
    );
  }
}
