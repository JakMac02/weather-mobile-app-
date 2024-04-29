import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
    const MapWidget({super.key});

    @override
    _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  String mapUrl = '';

  void showTemperatureMap() {
    setState(() {
      mapUrl = "https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?appid=e58ca8356ab77502cd5204c1cead53c3";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: const MapOptions(
              crs: Epsg3857(),
              initialCenter: LatLng(54.8,17),
              initialZoom: 3),
          children: [
            TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
            ),
            TileLayer(
                urlTemplate: mapUrl
            )
          ]),
        floatingActionButton: FloatingActionButton(
          onPressed: showTemperatureMap,
          tooltip: 'Temperature Map',
          child: const Icon(Icons.add),
        ),
    );
  }

}