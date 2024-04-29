import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
    const MapWidget({super.key});

    @override
    _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: const MapOptions(
              crs: Epsg3857(),
              initialCenter: LatLng(52.23, 21.01),
              initialZoom: 15),
          children: [
            TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
            )
          ]),
    )
  }

}