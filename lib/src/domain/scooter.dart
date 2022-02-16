import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part '../domain/scooter.g.dart';

@immutable
@JsonSerializable()
class Scooter extends Equatable {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final int batteryLevel;
  final String timestamp;
  final int price;
  final int priceTime;
  final String currency;

  const Scooter({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.batteryLevel,
    required this.timestamp,
    required this.price,
    required this.priceTime,
    required this.currency,
  });

  factory Scooter.fromJson(Map<String, dynamic> json) =>
      _$ScooterFromJson(json);

  @override
  List<Object> get props => [
        id,
        name,
        description,
        latitude,
        longitude,
        batteryLevel,
        timestamp,
        price,
        priceTime,
        currency
      ];
}
