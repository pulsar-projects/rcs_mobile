import 'package:flutter/cupertino.dart';

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
      Text('Recycle Centers Map Placeholder'));
  }
}
