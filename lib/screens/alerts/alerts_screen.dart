// lib/screens/alerts/alerts_screen.dart
import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Alerts Screen!'),
      ),
    );
  }
}
