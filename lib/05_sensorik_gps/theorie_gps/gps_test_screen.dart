import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSTestScreen extends StatefulWidget {
  const GPSTestScreen({super.key});

  @override
  State<GPSTestScreen> createState() => _GPSTestScreenState();
}

class _GPSTestScreenState extends State<GPSTestScreen> {
  String _text = "Position wird geladen...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _text = "Standortdienst ist deaktiviert.");
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _text = 'Standortberechtigung verweigert.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _text = 'Standortberechtigung dauerhaft verweigert.');
      return;
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() => _text = 'Lat: ${position.latitude}, Long: ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPS-Position')),
      body: Center(
        child: Text(_text, textAlign: TextAlign.center),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
