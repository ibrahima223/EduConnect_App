import 'package:flutter/material.dart';

class TelechargementPage extends StatelessWidget {
  const TelechargementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Téléchargements'),
      ),
      body: const Center(
        child: Text('Page des téléchargements'),
      ),
    );
  }
} 