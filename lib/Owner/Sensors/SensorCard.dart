import 'package:flutter/material.dart';
import 'package:bulty_farmm/Owner/Home/Homepage.dart';
import 'package:bulty_farmm/Owner/Sensors/Temperaturepage.dart';
import 'package:bulty_farmm/Owner/Sensors/BiomassPage.dart';
import 'package:bulty_farmm/Owner/Sensors/FishDiseasesPage.dart';
import 'package:bulty_farmm/Owner/Sensors/waterlevelpage.dart';
import 'package:bulty_farmm/Owner/Sensors/PHLevelDataPage.dart';
class SensorCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String fontFamily;
  final List<SensorData> sensorData; // Define sensorData here

  const SensorCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.fontFamily,
    required this.sensorData, // Add sensorData here
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (title) { // Using title directly instead of sensorData[index].title
          case 'Temperature':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemperaturePage()),
            );
            break;
          case 'Water Level':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WaterLevelPage()),
            );
            break;
          case 'PH Level':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PHLevelDataPage()),
            );
            break;
          case 'Biomass':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BiomassPage()),
            );
            break;
          case 'Fish Diseases':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FishDiseasesPage()),
            );
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ Color(0xFF008B8B), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18, fontFamily: fontFamily),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
