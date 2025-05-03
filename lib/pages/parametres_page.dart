import 'package:flutter/material.dart';

class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  bool darkMode = false;
  String language = 'Français';
  bool courseNotif = true;
  bool quizNotif = true;
  bool messageNotif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Profil'),
          _buildSettingTile(
            title: 'Modifier le profil',
            icon: Icons.person,
            onTap: () {
              // Navigate to edit profile
            },
          ),
          _buildSettingTile(
            title: 'Changer la langue',
            icon: Icons.language,
            trailing: DropdownButton<String>(
              value: language,
              items: ['Français', 'Anglais'].map((lang) {
                return DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (val) {
                setState(() => language = val!);
              },
            ),
          ),
          _buildSwitchTile(
            title: 'Thème sombre',
            value: darkMode,
            onChanged: (val) {
              setState(() => darkMode = val);
            },
          ),
          _buildSectionTitle('Compte & sécurité'),
          _buildSettingTile(
            title: "Modifier l'adresse email",
            icon: Icons.email,
            onTap: () async {
              // Email update UI
            },
          ),
          _buildSettingTile(
            title: "Changer le mot de passe",
            icon: Icons.lock,
            onTap: () async {
              // Password update UI
            },
          ),
          _buildSettingTile(
            title: "Historique des connexions",
            icon: Icons.history,
            onTap: () {
              // Show login history
            },
          ),
          _buildSectionTitle('Notifications'),
          _buildSwitchTile(
            title: 'Notifications des cours',
            value: courseNotif,
            onChanged: (val) {
              setState(() => courseNotif = val);
            },
          ),
          _buildSwitchTile(
            title: 'Rappels de quiz / devoirs',
            value: quizNotif,
            onChanged: (val) {
              setState(() => quizNotif = val);
            },
          ),
          _buildSwitchTile(
            title: 'Messages et messagerie',
            value: messageNotif,
            onChanged: (val) {
              setState(() => messageNotif = val);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Show delete account confirmation dialog
            },
            child: const Text(
              'Supprimer mon compte',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: trailing ?? const Icon(
          Icons.arrow_forward_ios,
          color: Colors.deepPurple,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.deepPurple,
      ),
    );
  }
} 