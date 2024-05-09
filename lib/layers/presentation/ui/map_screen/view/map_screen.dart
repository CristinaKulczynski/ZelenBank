import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zelenbank/layers/presentation/controllers/map_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/statement_screen_app_bar.dart';

final appKey = GlobalKey();

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: const StatementAppBarWidget(
        title: 'Banco Zelen nas proximidades',
      ),
      body: AnimatedBuilder(
        animation: mapController,
        builder: (context, child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(mapController.lat, mapController.long),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: mapController.onMapCreated,
            markers: mapController.markers,
          );
        },
      ),
    );
  }
}
