import 'package:flutter/foundation.dart';

class RecycledItem {
  final String id;
  final String name;
  final String description;
  final DateTime dateTime;

  RecycledItem({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.dateTime,
  });
}