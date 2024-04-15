import 'package:flutter/material.dart';
class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Settings'),
      ),
      body: const Center(
        child: Text('Notifications Settings Page'),
      ),
    );
  }
}


