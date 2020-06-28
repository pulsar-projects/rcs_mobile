import 'package:flutter/foundation.dart';

class RecycleCenter {
  final String id;
  final String description;
  final double latitude;
  final double longitude;

  RecycleCenter({
    @required this.id,
    @required this.description,
    @required this.latitude,
    @required this.longitude,
  });
}