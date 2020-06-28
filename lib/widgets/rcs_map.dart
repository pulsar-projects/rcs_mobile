import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class RcsMap extends StatelessWidget {

  static const double _markerSize = 40.0;
  final List locations;
  //final dynamic query;

  const RcsMap({this.locations});


  List<Marker> getMarkers(List locations) {
    return locations.map((loc) {
      return Marker(
          width: _markerSize,
          height: _markerSize,
          point: loc,
          builder: (context) => Icon(
        Icons.location_on,
        color: Theme.of(context).accentColor,
        size: _markerSize,
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: locations[0],
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
        MarkerLayerOptions(markers: getMarkers(locations))
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