import 'package:flutter/material.dart';
import 'recompenses_page.dart';
import 'parametres_page.dart';
import 'modifier_profil_page.dart';

class ProfilsPage extends StatelessWidget {
  const ProfilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image de profil
            CircleAvatar(
              radius: 50,
              backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
              backgroundColor: Colors.deepPurple.withOpacity(0.1),
            ),
            const SizedBox(height: 10),
            // Username
            const Text(
              '@Username',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 5),
            // Classe
            Text(
              'Terminal Science Exacte',
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(
                    icon: Icons.timer,
                    value: '6',
                    label: 'Cours Terminés',
                  ),
                  _buildStatCard(
                    icon: Icons.quiz,
                    value: '12',
                    label: 'Quiz Réussis',
                  ),
                  _buildStatCard(
                    icon: Icons.timer_outlined,
                    value: '24h',
                    label: 'Temps Utilisation',
                  ),
                  _buildStatCard(
                    icon: Icons.star,
                    value: '150',
                    label: 'Points',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Section Informations Personnelles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informations Personnelles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoCard(
                    icon: Icons.person,
                    title: 'Nom Prénom',
                    value: 'Doumbia Ladji',
                  ),
                  _buildInfoCard(
                    icon: Icons.phone,
                    title: 'Numéro',
                    value: '+225 07 07 07 07 07',
                  ),
                  _buildInfoCard(
                    icon: Icons.email,
                    title: 'Email',
                    value: 'ladji.doumbia@example.com',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Section Autre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Autre',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuButton(
                    icon: Icons.edit,
                    label: 'Modifier le profil',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ModifierProfilPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.settings,
                    label: 'Paramètres',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParametresPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.card_giftcard,
                    label: 'Récompenses',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecompensesPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.support_agent,
                    label: 'Service d\'assistance',
                    onTap: () {},
                  ),
                  _buildMenuButton(
                    icon: Icons.logout,
                    label: 'Déconnexion',
                    onTap: () {},
                    isLogout: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.deepPurple, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.deepPurple.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.deepPurple.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.deepPurple.withOpacity(0.7),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : Colors.deepPurple,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isLogout ? Colors.red : Colors.deepPurple,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.deepPurple.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
} 