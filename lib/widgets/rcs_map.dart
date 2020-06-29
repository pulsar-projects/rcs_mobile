import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:rcs_mobile/model/recycle_center_model.dart';

class RcsMap extends StatelessWidget {

  static const double _markerSize = 40.0;
  final List<RecycleCenter> recycleCenters;
  final LatLng currentLocation;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const RcsMap({this.recycleCenters, this.currentLocation, this.scaffoldKey});


  List<Marker> getMarkers(BuildContext context, List<RecycleCenter> recycleCenters) {
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // add recycle centers
    List<Marker> markers = recycleCenters.map((rc) {
      return Marker(
          width: _markerSize,
          height: _markerSize,
          point: LatLng(rc.latitude, rc.longitude),
          builder: (context) =>
              Container(
                  child: GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState.showSnackBar(
                            SnackBar(

                                content: markerDetail(context, rc),
                        ));
                      },
                      child:
                      Icon(
                        Icons.add_location,
                        color: Theme
                            .of(context)
                            .accentColor,
                        size: _markerSize,
                      )
                  )
              )
      );
    }).toList();

    // add current location
    markers.add(Marker(
        width: _markerSize,
        height: _markerSize,
        point: currentLocation,
        builder: (context) =>
            Icon(
              Icons.location_on,
              color: Colors.redAccent,
              size: _markerSize,
            )
    )
    );

    return markers;
  }

  Widget markerDetail(BuildContext context, RecycleCenter rc){

    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: ListView(
        children: <Widget>[
          Text(rc.description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
          Text(rc.address),
          Text(rc.hours),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text('Pick Center'),
            onPressed: () {
              Navigator.pop(context, rc);
            },
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: currentLocation,
        zoom: 12,
        minZoom: 5,
        maxZoom: 20,
      ),
      layers: <LayerOptions>[
        TileLayerOptions(
          urlTemplate: Theme.of(context).brightness == Brightness.light
              ? Url.lightMap
              : Url.darkMap,
          subdomains: ['a', 'b', 'c'],
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        MarkerLayerOptions(markers: getMarkers(context, recycleCenters))
      ],
    );
  }
}

/// Has all urls used in the app as static const strings.
class Url {
// Map URL
  static const String lightMap =
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png';
  //"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";

  static const String darkMap =
  //'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png';
      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
}