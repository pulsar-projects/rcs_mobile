import 'package:flutter/foundation.dart';
import 'package:rcs_mobile/model/recycle_center.dart';

class RecycleCentersProvider with ChangeNotifier {
  final String _userId = '_userId';
  final String _token = '_token';
  
  List<RecycleCenter> _recycleCenters = [
    RecycleCenter(
        id: 'Q1RQNVJYXV5EXQ',
        description: 'TRC America, Inc.',
        latitude: 28.61013183784204,
        longitude: -81.41839130790073),
    RecycleCenter(
        id: 'Q1RQNVJYXVpHUg',
        description: 'Staples',
        latitude: 28.54991397357379,
        longitude: -81.3486623442333),
  ];

//  RecycledItemsProvider(
//    this._userId,
//    this._token,
//    this._recycledItems,
//  );

  List<RecycleCenter> get getItems {
    return [..._recycleCenters];
  }

  RecycleCenter getItemById(String id) {
    return [..._recycleCenters].firstWhere((element) => element.id == id);
  }
  
}
