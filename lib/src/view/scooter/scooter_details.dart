import 'package:escooters/src/domain/scooter/scooter_marker.dart';
import 'package:flutter/material.dart';

class ScooterDetails extends StatelessWidget {
  final ScooterMarker scooter;

  const ScooterDetails(
    this.scooter, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(scooter.name, style: textTheme.headline6),
              Icon(scooter.battery.icon, color: scooter.battery.color),
            ],
          ),
          const SizedBox(height: 8),
          Text(scooter.price, style: textTheme.subtitle1),
          const SizedBox(height: 8),
          Text(scooter.timeStamp, style: textTheme.caption),
        ],
      ),
    );
  }
}
