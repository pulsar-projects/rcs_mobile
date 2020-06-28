import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:rcs_mobile/model/recycle_center_model.dart';
import 'package:rcs_mobile/model/recycled_item_status_enum.dart';

class RecycledItem {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final File image;
  final DateTime dateTime;
  final RecycleCenter recycleCenter;
  RecycledItemStatus status;

  RecycledItem({
    this.id,
    @required this.name,
    @required this.description,
    this.imagePath,
    this.image,
    @required this.dateTime,
    this.recycleCenter,
    this.status = RecycledItemStatus.DEFAULT,
  });
}
