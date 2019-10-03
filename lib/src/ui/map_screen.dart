import 'package:escooters/src/data/scooter.dart';
import 'package:escooters/src/data/scooter_service.dart';
import 'package:escooters/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-scooters'),
        elevation: 0,
      ),
      body: FutureBuilder<Iterable<Scooter>>(
          future: inject<ScooterService>().fetchAll(),
          builder: (context, snapshot) {
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746,
              ),
            );
          }),
    );
  }
}
