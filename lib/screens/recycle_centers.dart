import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rcs_mobile/widgets/rcs_map.dart';
import 'package:latlong/latlong.dart';

class RecycleCentersMap extends StatefulWidget {
  static const routeName = '/recycleCentersMap';
  final List recognitions;

  RecycleCentersMap({this.recognitions});

  @override
  _RecycleCentersMapState createState() => _RecycleCentersMapState();
}

class _RecycleCentersMapState extends State<RecycleCentersMap> {

  @override
  Widget build(BuildContext context) {
    return Container(child:
      RcsMap(locations: [LatLng(28.61, -81.41), LatLng(28.50,-81.446)]));
  }
}
