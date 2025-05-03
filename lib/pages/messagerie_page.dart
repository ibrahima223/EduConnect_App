import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessageriePage extends StatelessWidget {
  const MessageriePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données fictives pour les conversations
    final conversations = [
      {
        'id': '1',
        'participants': ['etudiant_1', 'prof_1'],
        'lastMessage': 'Bonjour, comment allez-vous ?',
        'unread': 2,
      },
      {
        'id': '2',
        'participants': ['etudiant_1', 'prof_2'],
        'lastMessage': 'Le devoir est à rendre pour demain',
        'unread': 0,
      },
      {
        'id': '3',
        'participants': ['etudiant_1', 'etudiant_2'],
        'lastMessage': 'Tu as compris l\'exercice ?',
        'unread': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messagerie'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final chat = conversations[index] as Map<String, dynamic>;
          final participants = chat['participants'] as List<String>;
          final otherUser = participants[1];
          final lastMessage = chat['lastMessage'] as String;
          final unread = chat['unread'] as int;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.deepPurple),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Text(
                  otherUser[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                otherUser,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(
                lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.deepPurple.withOpacity(0.7),
                ),
              ),
              trailing: unread > 0 
                ? CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '$unread',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ) 
                : null,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    currentUserId: 'etudiant_1',
                    otherUserId: otherUser,
                    chatId: chat['id'] as String,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 