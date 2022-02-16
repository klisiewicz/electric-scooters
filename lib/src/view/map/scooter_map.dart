import 'package:escooters/src/domain/scooter.dart';
import 'package:escooters/src/view/scooter/scooter_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScooterMap extends StatefulWidget {
  final List<Scooter> scooters;

  const ScooterMap({
    this.scooters = const [],
    Key? key,
  }) : super(key: key);

  @override
  State<ScooterMap> createState() => _ScooterMapState();
}

class _ScooterMapState extends State<ScooterMap> {
  static const _scooterImageUri = 'assets/images/scooter.png';
  static const _mapCenter = LatLng(52.5, 13.4);

  BitmapDescriptor? _markerIcon;

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: _mapCenter,
        zoom: 12,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: widget.scooters
          .map((scooter) => scooter.toMarker(context, _markerIcon))
          .toSet(),
    );
  }

  void _createMarkerImageFromAsset(BuildContext context) {
    if (_markerIcon == null) {
      BitmapDescriptor.fromAssetImage(
        createLocalImageConfiguration(context),
        _scooterImageUri,
      ).then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }
}

extension on Scooter {
  Marker toMarker(BuildContext context, BitmapDescriptor? markerIcon) {
    return Marker(
      markerId: MarkerId(id),
      position: LatLng(location.latitude, location.longitude),
      icon: markerIcon ?? BitmapDescriptor.defaultMarker,
      onTap: () {
        _showScooterDetails(context, this);
      },
    );
  }
}

void _showScooterDetails(BuildContext context, Scooter scooter) {
  showModalBottomSheet(
    context: context,
    builder: (context) => ScooterDetails(scooter),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
  );
}
