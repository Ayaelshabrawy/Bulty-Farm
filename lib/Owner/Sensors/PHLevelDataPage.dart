import 'package:flutter/material.dart';
class PHLevelDataPage extends StatelessWidget {
  const PHLevelDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'TT Firs Neue', // Specify the font family here
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PH Level Data'),
        ),
        body: const Center(
          child: Text(
            'PH Level Data will be displayed here.',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
