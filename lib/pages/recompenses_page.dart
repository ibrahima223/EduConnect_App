import 'package:flutter/material.dart';

class RecompensesPage extends StatelessWidget {
  const RecompensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Récompenses'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section Badges
            _buildBadgesSection(),
            const SizedBox(height: 30),
            // Section Certificats
            _buildCertificatesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Badges',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Filtres
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterChip('Tous'),
              _buildFilterChip('Obtenu'),
              _buildFilterChip('À débloquer'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Grille de badges
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildBadgeCard(
              badgeImage: 'lib/assets/images/Badge_Bronze.png',
              title: 'Débutant engagé',
              level: 'Bronze',
              levelColor: Colors.brown,
              criteria: 'Attribué après avoir terminé 5 cours',
            ),
            _buildBadgeCard(
              badgeImage: 'lib/assets/images/Badge_Argent.png',
              title: 'Quiz Master',
              level: 'Argent',
              levelColor: Colors.grey,
              criteria: 'Réussir 10 quiz consécutifs',
            ),
            _buildBadgeCard(
              badgeImage: 'lib/assets/images/Badge_Or.png',
              title: 'Étudiant assidu',
              level: 'Or',
              levelColor: Colors.amber,
              criteria: '20 heures d\'étude complétées',
            ),
            _buildBadgeCard(
              badgeImage: 'lib/assets/images/Badge_Unknow.png',
              title: 'Collaborateur',
              level: 'Bronze',
              levelColor: Colors.brown,
              criteria: 'Participer à 3 discussions',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      selected: label == 'Tous',
      onSelected: (bool selected) {
        // TODO: Implémenter la logique de filtrage
      },
    );
  }

  Widget _buildBadgeCard({
    required String badgeImage,
    required String title,
    required String level,
    required Color levelColor,
    required String criteria,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Partie supérieure
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    badgeImage,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.emoji_events, size: 40, color: levelColor);
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: levelColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            level,
                            style: TextStyle(
                              color: levelColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Critères
              Text(
                criteria,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCertificatesSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Certificats',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildCertificateCard(),
        const SizedBox(height: 16),
        _buildCertificateCard(),
      ],
    );
  }

  Widget _buildCertificateCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Partie 1: En-tête avec icône, date et bouton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.school, color: Colors.blue),
                    const SizedBox(width: 8),
                    const Text('Certificat de Mathématiques'),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {
                    // TODO: Implémenter le téléchargement
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('Télécharger'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Partie 2: Progression
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Encore 3 quiz pour obtenir le certificat',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tu es à 70% du niveau Or',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.amber[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Partie 3: Bouton aperçu
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implémenter l'aperçu
              },
              icon: const Icon(Icons.visibility),
              label: const Text('Aperçu'),
            ),
          ],
        ),
      ),
    );
  }
} 