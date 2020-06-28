import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcs_mobile/providers/recycle_center_provider.dart';
import 'package:rcs_mobile/widgets/rcs_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class RecycleCentersMap extends StatefulWidget {
  static const routeName = '/recycleCentersMap';
  final List recognitions;

  RecycleCentersMap({this.recognitions});

  @override
  _RecycleCentersMapState createState() => _RecycleCentersMapState();
}

class _RecycleCentersMapState extends State<RecycleCentersMap> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: _scaffoldKey,
      body: Consumer<RecycleCentersProvider>(
          builder: (context, recycleCentersProvider, _) =>
              Container(
                child:
                RcsMap(recycleCenters: recycleCentersProvider.getItems,
                       currentLocation: LatLng(28.54568, -81.3812777),
                       scaffoldKey: _scaffoldKey),
              )
      ),
    );
  }
}