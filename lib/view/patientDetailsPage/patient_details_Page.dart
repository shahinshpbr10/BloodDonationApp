
import 'package:blood_donation_app/view/patientDetailsPage/widgets/fullscreen_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../common/apptextstyle.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final LatLng patientLocation = const LatLng(10.999390, 76.213318);
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  child: FlutterMap(
                    options: MapOptions(
                      center: patientLocation,
                      zoom: 14,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
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
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.fullscreen),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientLocationScreen(
                              currentLocation: currentLocation,
                            ),
                          ),
                        );
                      },
                      tooltip: 'Full Screen Map',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Shahinsh pbr',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Ph +91 623838992',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  _buildInfoRow('Patient Name', 'Shahinsh pbr'),
                  _buildInfoRow('Required Blood', 'A+'),
                  _buildInfoRow('Required Unit', '6 Unit'),
                  _buildInfoRow('Patient Place', 'malappuram'),
                  _buildInfoRow('Case', ''),
                  _buildInfoRow('Bystander Name', 'Nishal PK'),
                  _buildInfoRow('Bystander Contact', '+91 6534873210'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Accept'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.smallBodyText.copyWith(color: Colors.grey[600]),
          ),
          Text(
            value,
            style:  AppTextStyles.bodyText,
          ),
        ],
      ),
    );
  }
}

