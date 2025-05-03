import 'package:flutter/material.dart';

class RecompensesPage extends StatelessWidget {
  const RecompensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Récompenses'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPointsCard(),
            const SizedBox(height: 24),
            _buildBadgesSection(),
            const SizedBox(height: 24),
            _buildAchievementsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.star,
            size: 50,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 16),
          const Text(
            '150 Points',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Continuez à apprendre pour gagner plus de points !',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Badges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildBadgeItem(
              icon: Icons.school,
              title: 'Débutant',
              isUnlocked: true,
            ),
            _buildBadgeItem(
              icon: Icons.auto_awesome,
              title: 'Étudiant',
              isUnlocked: true,
            ),
            _buildBadgeItem(
              icon: Icons.workspace_premium,
              title: 'Expert',
              isUnlocked: false,
            ),
            _buildBadgeItem(
              icon: Icons.timer,
              title: 'Assidu',
              isUnlocked: true,
            ),
            _buildBadgeItem(
              icon: Icons.quiz,
              title: 'Quiz Master',
              isUnlocked: false,
            ),
            _buildBadgeItem(
              icon: Icons.verified,
              title: 'Certifié',
              isUnlocked: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadgeItem({
    required IconData icon,
    required String title,
    required bool isUnlocked,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUnlocked
            ? Colors.deepPurple.withOpacity(0.1)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isUnlocked ? Colors.deepPurple : Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: isUnlocked ? Colors.deepPurple : Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isUnlocked ? Colors.deepPurple : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Réalisations',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 16),
        _buildAchievementItem(
          title: 'Premier cours terminé',
          description: 'Vous avez terminé votre premier cours',
          isCompleted: true,
        ),
        _buildAchievementItem(
          title: '5 quiz réussis',
          description: 'Vous avez réussi 5 quiz consécutifs',
          isCompleted: true,
        ),
        _buildAchievementItem(
          title: '10 heures d\'apprentissage',
          description: 'Vous avez passé 10 heures à apprendre',
          isCompleted: false,
        ),
      ],
    );
  }

  Widget _buildAchievementItem({
    required String title,
    required String description,
    required bool isCompleted,
  }) {
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
} 