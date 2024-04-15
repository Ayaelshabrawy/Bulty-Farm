import 'package:flutter/material.dart';
class WaterLevelPage extends StatelessWidget {
  const WaterLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Level Data'),
      ),
      body: const Center(
        child: Text(
          'Detailed water level data will be displayed here.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}