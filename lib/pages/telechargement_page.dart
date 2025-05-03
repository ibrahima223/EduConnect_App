import 'package:flutter/material.dart';

class TelechargementPage extends StatelessWidget {
  const TelechargementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Téléchargements'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          DownloadItem(
            title: "Introduction à Flutter",
            description: "Cours téléchargé",
            icon: Icons.book,
          ),
          const SizedBox(height: 10),
          DownloadItem(
            title: "Cours de Dart",
            description: "Cours téléchargé",
            icon: Icons.code,
          ),
          const SizedBox(height: 10),
          DownloadItem(
            title: "Développement Mobile",
            description: "Cours téléchargé",
            icon: Icons.phone_android,
          ),
        ],
      ),
    );
  }
}

class DownloadItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const DownloadItem({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description, 
                  style: TextStyle(
                    color: Colors.deepPurple.withOpacity(0.7)
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
} 