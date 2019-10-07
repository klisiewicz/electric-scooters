import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/view/scooter/scooter_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScooterMap extends StatelessWidget {
  final Locations locations;

  const ScooterMap(this.locations, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          locations.camera.latitude,
          locations.camera.longitude,
        ),
        zoom: 12,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: locations.scooters
          .map((scooter) => _toMarker(context, scooter))
          .toSet(),
    );
  }

  Marker _toMarker(BuildContext context, ScooterMarker scooter) {
    return Marker(
      markerId: MarkerId(scooter.id),
      position: LatLng(
        scooter.location.latitude,
        scooter.location.longitude,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      onTap: () {
        _showScooterDetails(context, scooter);
      },
    );
  }

  void _showScooterDetails(BuildContext context, ScooterMarker scooter) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ScooterDetails(scooter),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
    );
  }
}
