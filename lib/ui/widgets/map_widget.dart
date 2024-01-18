import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatelessWidget {
  const MapWidget(this.longitude, this.latitude, {super.key});

  final double longitude;
  final double latitude;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(latitude, longitude),
        zoom: 15.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(latitude, longitude),
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () {
                    final url = Uri.parse(
                        'https://www.google.co.jp/maps/@$latitude,$longitude,18z?hl=ja&q=@$latitude,$longitude'
                    );
                    launchUrl(url);
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }
}
