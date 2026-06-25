import 'package:flutter/material.dart';

/// Home Screen for Chandira Kids App
/// Displays products with search and category filtering
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chandira Kids'),
        backgroundColor: const Color(0xFFFF69B4),
      ),
      body: const Center(
        child: Text('Home Screen - Coming Soon'),
      ),
    );
  }
}
