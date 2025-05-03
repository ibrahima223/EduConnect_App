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
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.7),
            tabs: const [
              Tab(icon: Icon(Icons.video_library), text: 'Vidéo'),
              Tab(icon: Icon(Icons.article), text: 'Texte'),
              Tab(icon: Icon(Icons.quiz), text: 'Quiz'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildVideoTab(),
            _buildTextTab(),
            _buildQuizTab(),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cours continué avec succès'),
                        backgroundColor: Colors.deepPurple,
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Continuer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Message envoyé au professeur'),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                },
                icon: const Icon(Icons.message),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.deepPurple.withOpacity(0.1),
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_filled,
                  size: 80,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    level,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Plan du cours',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          _buildCourseOutlineItem(
            '1. Introduction',
            'Les bases fondamentales',
            true,
          ),
          _buildCourseOutlineItem(
            '2. Concepts clés',
            'Les principes essentiels',
            true,
          ),
          _buildCourseOutlineItem(
            '3. Applications pratiques',
            'Mise en pratique des concepts',
            false,
          ),
          _buildCourseOutlineItem(
            '4. Études de cas',
            'Exemples concrets',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseOutlineItem(
    String title,
    String description,
    bool isCompleted,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.deepPurple.withOpacity(0.1)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isCompleted ? Colors.deepPurple : Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.lock,
            color: isCompleted ? Colors.deepPurple : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.deepPurple : Colors.grey,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: isCompleted
                        ? Colors.deepPurple.withOpacity(0.7)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz,
            size: 80,
            color: Colors.deepPurple.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Quiz à venir',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Le quiz sera disponible une fois le cours terminé',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
} 