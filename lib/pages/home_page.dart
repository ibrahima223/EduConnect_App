import 'package:flutter/material.dart';
import 'cours_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduConnect'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Part 1: Profil
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('lib/assets/images/profile.png'),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Salut Ladji Doumbia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Part 2: Barre de recherche
              TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un cours...',
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.deepPurple.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 20),

              // Part 3: Filtres
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      label: const Text('Filière'),
                      selected: false,
                      backgroundColor: Colors.deepPurple.withOpacity(0.1),
                      onSelected: (bool value) {},
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Classe'),
                      selected: false,
                      backgroundColor: Colors.deepPurple.withOpacity(0.1),
                      onSelected: (bool value) {},
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Matière'),
                      selected: false,
                      backgroundColor: Colors.deepPurple.withOpacity(0.1),
                      onSelected: (bool value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Part 4: Recommandations
              const Text(
                'Recommandations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CourseCard(
                      subject: 'Mathématiques',
                      title: 'Algèbre Linéaire',
                      color: Colors.deepPurple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursDetailPage(
                              subject: 'Mathématiques',
                              title: 'Algèbre Linéaire',
                              description: 'Ce cours vous propose une exploration approfondie de l\'algèbre linéaire, avec des exemples pratiques et des exercices.',
                              level: 'Terminale',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    CourseCard(
                      subject: 'Physique',
                      title: 'Mécanique Quantique',
                      color: Colors.deepPurple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursDetailPage(
                              subject: 'Physique',
                              title: 'Mécanique Quantique',
                              description: 'Découvrez les principes fondamentaux de la mécanique quantique à travers des expériences virtuelles et des simulations.',
                              level: 'Terminale',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    CourseCard(
                      subject: 'Informatique',
                      title: 'Programmation Python',
                      color: Colors.deepPurple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursDetailPage(
                              subject: 'Informatique',
                              title: 'Programmation Python',
                              description: 'Apprenez les bases de la programmation Python avec des projets pratiques et des exercices interactifs.',
                              level: 'Première',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Part 5: Continuer l'apprentissage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Continuer l\'apprentissage',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, color: Colors.deepPurple),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProgressCourseCard(
                      subject: 'Mathématiques',
                      title: 'Calcul Différentiel',
                      color: Colors.deepPurple,
                      progress: 0.6,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursDetailPage(
                              subject: 'Mathématiques',
                              title: 'Calcul Différentiel',
                              description: 'Maîtrisez les concepts du calcul différentiel avec des explications détaillées et des exercices progressifs.',
                              level: 'Terminale',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    ProgressCourseCard(
                      subject: 'Chimie',
                      title: 'Chimie Organique',
                      color: Colors.deepPurple,
                      progress: 0.3,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursDetailPage(
                              subject: 'Chimie',
                              title: 'Chimie Organique',
                              description: 'Explorez le monde fascinant de la chimie organique à travers des expériences virtuelles et des modèles 3D.',
                              level: 'Terminale',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Part 6: Boutons d'action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActionButton(
                    icon: Icons.school,
                    label: 'Tous les cours',
                    onPressed: () {},
                  ),
                  ActionButton(
                    icon: Icons.quiz,
                    label: 'Quizz',
                    onPressed: () {},
                  ),
                  ActionButton(
                    icon: Icons.verified,
                    label: 'Certificats',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Part 7: Statistiques
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.timer,
                      value: '45 min',
                      label: 'Activité aujourd\'hui',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      icon: Icons.star,
                      value: '1200 XP',
                      label: 'Cette semaine',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String subject;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.subject,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subject,
                style: TextStyle(
                  color: color.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Icon(
                  Icons.school,
                  size: 50,
                  color: color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressCourseCard extends StatelessWidget {
  final String subject;
  final String title;
  final Color color;
  final double progress;
  final VoidCallback? onTap;

  const ProgressCourseCard({
    super.key,
    required this.subject,
    required this.title,
    required this.color,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subject,
                style: TextStyle(
                  color: color.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Icon(
                  Icons.school,
                  size: 50,
                  color: color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: Colors.deepPurple,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 