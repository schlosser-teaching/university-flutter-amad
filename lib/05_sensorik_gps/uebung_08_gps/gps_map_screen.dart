import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class GPSMapScreen extends StatefulWidget {
  const GPSMapScreen({super.key});

  @override
  State<GPSMapScreen> createState() => _GPSMapScreenState();
}

class _GPSMapScreenState extends State<GPSMapScreen> {
  final _mapController = MapController();

  StreamSubscription<Position>? _positionStreamSubscription;
  Position? _position;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeLocationService();
  }

  Future<void> _initializeLocationService() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _error = "Standortdienst ist deaktiviert.");
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _error = 'Standortberechtigung verweigert.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _error = 'Standortberechtigung dauerhaft verweigert.');
      return;
    }

    _listenToLocationUpdates();
  }

  void _listenToLocationUpdates() {
    _positionStreamSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 2))
        .listen((final position) {
          setState(() {
            _position = position;
            _mapController.move(
              LatLng(position.latitude, position.longitude),
              _mapController.camera.zoom,
            );
          });
    }, onError: (error) {
      setState(() => _error = 'Fehler beim Abrufen der Position.');
    });
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Karte')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: _position != null
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Höhe: ${_position!.altitude.toStringAsFixed(0)} m'),
                Text('Geschwindigkeit: ${(3.6 * _position!.speed).toStringAsFixed(0)} km/h'),
              ],
            )
                : _error != null
                ? Text(_error!)
                : const Text('Standort wird geladen...'),
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: const MapOptions(initialZoom: 18),
              children: [
                TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                if (_position != null)
                  MarkerLayer(markers: [
                    Marker(
                      point: LatLng(_position!.latitude, _position!.longitude),
                      child: Icon(
                        Icons.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
