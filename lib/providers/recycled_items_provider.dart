import 'package:flutter/foundation.dart';
import 'package:rcs_mobile/model/recycled_item_model.dart';

class RecycledItemsProvider with ChangeNotifier {
  final String _userId = '_userId';
  final String _token = '_token';
  List<RecycledItem> _recycledItems = [
    RecycledItem(
        id: DateTime.now().toIso8601String(),
        dateTime: DateTime.now(),
        name: 'Office paper',
        description: 'My office paper'),
    RecycledItem(
        id: DateTime.now().toIso8601String(),
        dateTime: DateTime.now(),
        name: 'Glass bottles',
        description: 'Green, clear and brown glass bottles'),
    RecycledItem(
        id: DateTime.now().toIso8601String(),
        dateTime: DateTime.now(),
        name: 'Office newspapers',
        description: 'Newspapers and junk mail.'),
    RecycledItem(
        id: DateTime.now().toIso8601String(),
        dateTime: DateTime.now(),
        name: 'Milk cartons',
        description: 'Milk containers'),
    RecycledItem(
        id: DateTime.now().toIso8601String(),
        dateTime: DateTime.now(),
        name: 'Cans',
        description: 'Steel and aluminium cans'),
  ];

//  RecycledItemsProvider(
//    this._userId,
//    this._token,
//    this._recycledItems,
//  );

  List<RecycledItem> get getRecycledItems {
    return [..._recycledItems];
  }
}
