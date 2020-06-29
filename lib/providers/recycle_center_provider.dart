import 'package:flutter/foundation.dart';
import 'package:rcs_mobile/model/recycle_center_model.dart';

class RecycleCentersProvider with ChangeNotifier {
  final String _userId = '_userId';
  final String _token = '_token';
  
  List<RecycleCenter> _recycleCenters = [
    RecycleCenter(
        id: 'Q1RQNVJYXV5EXQ',
        description: 'TRC America, Inc.',
        latitude: 28.61013183784204,
        longitude: -81.41839130790073,
        address: "5701 Carder Rd",
        hours: "Monday to Friday 8am to 11:45 and 1pm  to 4pm. Saturday 8am to 12:45pm"
    ),
    RecycleCenter(
        id: 'Q1RQNVJYXVpHUg',
        description: 'Staples',
        latitude: 28.54991397357379,
        longitude: -81.3486623442333,
        hours: "Monday to Friday 8am to 8pm, Saturday 9am to 7pm and Sunday 10am to 6pm",
        address: "2774 East Colonial Drive"
    ),

    RecycleCenter(
        id: 'Q1RQNVJbWFpLUw',
        description: 'McLeod Road Transfer Station',
        latitude: 28.50212929345988,
        longitude: -81.44663812720069,
        hours: "Daily, 8am to 5pm",
        address: "5000 L B McLeod Rd"
    ),
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
