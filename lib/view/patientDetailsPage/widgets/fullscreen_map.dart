
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PatientLocationScreen extends StatelessWidget {
  final LatLng patientLocation = const LatLng(10.999390, 76.213318);
  final LatLng? currentLocation;

  const PatientLocationScreen({
    Key? key,
    this.currentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: patientLocation,
                zoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                if (currentLocation != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [patientLocation, currentLocation!],
                        strokeWidth: 4,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: patientLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                    if (currentLocation != null)
                      Marker(
                        point: currentLocation!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Natasha Giotra',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Ph +91 9874512610',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.message, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}