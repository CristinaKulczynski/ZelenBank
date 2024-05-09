import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zelenbank/core/map/map_locations.dart';
import 'package:zelenbank/layers/presentation/ui/map_screen/components/map_location_details_widget.dart';
import 'package:zelenbank/layers/presentation/ui/map_screen/view/map_screen.dart';

class MapController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    await getPosicao();
    await loadBanks();
  }

  loadBanks() {
    final banks = MapRepository().maps;
    banks.forEach((location) async {
      markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            'assets/bank_map_icon.png',
          ),
          onTap: () => {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: appKey.currentState!.context,
              builder: (context) => MapLocationDetailsWidget(map: location),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position position = await _currentPosition();
      lat = position.latitude;
      long = position.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;

    bool activated = await Geolocator.isLocationServiceEnabled();
    if (!activated) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
