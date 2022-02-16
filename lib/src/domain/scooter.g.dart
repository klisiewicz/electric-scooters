// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scooter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scooter _$ScooterFromJson(Map<String, dynamic> json) => Scooter(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      batteryLevel: json['batteryLevel'] as int,
      timestamp: json['timestamp'] as String,
      price: json['price'] as int,
      priceTime: json['priceTime'] as int,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$ScooterToJson(Scooter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'batteryLevel': instance.batteryLevel,
      'timestamp': instance.timestamp,
      'price': instance.price,
      'priceTime': instance.priceTime,
      'currency': instance.currency,
    };
