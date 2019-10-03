import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scooter.g.dart';

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
    this.id,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.batteryLevel,
    this.timestamp,
    this.price,
    this.priceTime,
    this.currency,
  });

  factory Scooter.fromJson(Map<String, dynamic> json) =>
      _$ScooterFromJson(json);

  Map<String, dynamic> toJson() => _$ScooterToJson(this);

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
