import 'package:flutter/material.dart';
class FishDiseasesPage extends StatelessWidget {
  const FishDiseasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish Diseases Data'),
      ),
      body: const Center(
        child: Text(
          'Detailed fish diseases data will be displayed here.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
