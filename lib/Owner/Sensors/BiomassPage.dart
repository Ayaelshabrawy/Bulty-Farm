import 'package:flutter/material.dart';
class BiomassPage extends StatelessWidget {
  const BiomassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biomass Data'),
      ),
      body: const Center(
        child: Text(
          'Detailed biomass data will be displayed here.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
