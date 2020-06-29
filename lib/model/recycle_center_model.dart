import 'package:flutter/foundation.dart';

class RecycleCenter {
  final String id;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final String hours;

  RecycleCenter({
    @required this.id,
    @required this.description,
    this.address,
    @required this.latitude,
    @required this.longitude,
    this.hours
  });
}