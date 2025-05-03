import 'package:flutter/material.dart';

class CoursDetailPage extends StatelessWidget {
  final String subject;
  final String title;
  final String description;
  final String level;

  const CoursDetailPage({
    super.key,
    required this.subject,
    required this.title,
    required this.description,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'Vidéo'),
              Tab(text: 'Texte'),
              Tab(text: 'Quizz'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildVideoTab(),
            buildTexteTab(),
            buildQuizzTab(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cours continué'),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                },
                child: const Text(
                  'Continuer le cours',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.withOpacity(0.1),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Message envoyé au professeur'),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                },
                child: Text(
                  'Contacter le professeur',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVideoTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.deepPurple.withOpacity(0.1),
                child: const Icon(
                  Icons.school,
                  size: 64,
                  color: Colors.deepPurple,
                ),
              ),
              const Icon(
                Icons.play_circle_fill,
                size: 64,
                color: Colors.deepPurple,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            subtitle: Text(
              '$level - $subject',
              style: TextStyle(
                color: Colors.deepPurple.withOpacity(0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTexteTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            'Plan du cours',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.deepPurple),
            title: const Text('Introduction'),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.deepPurple.withOpacity(0.5)),
            title: Text('Chapitre 1 - $subject'),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.deepPurple.withOpacity(0.5)),
            title: Text('Chapitre 2 - $subject'),
          ),
        ],
      ),
    );
  }

  Widget buildQuizzTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz,
            size: 64,
            color: Colors.deepPurple.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Quizz à venir...',
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
} 