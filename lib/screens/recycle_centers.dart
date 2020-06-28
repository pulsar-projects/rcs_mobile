import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<RecycleCentersProvider>(
        builder: (context, recycleCentersProvider, _) =>
            Container(
              child:
              RcsMap(recycleCenters: recycleCentersProvider.getItems, currentLocation: LatLng(28.54568, -81.3812777),),
            )
    );
  }
}

//Consumer<RecycledItemsProvider>(
//builder: (context, recycledItemsProvider, _) => SliverList(
//delegate: SliverChildBuilderDelegate(
//(context, index) {
//return RecycledCard(
//recycledItem: recycledItemsProvider.getItems[index],
//);
//},
//childCount: recycledItemsProvider.getItems.length,
//),
//),
//),