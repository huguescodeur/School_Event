import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
      ),
      body: ListView.builder(
        itemCount: 10, // Placeholder pour le nombre de discussions
        itemBuilder: (context, index) {
          return DiscussionCard(
            title: 'Discussion $index',
            author: 'Auteur de la discussion',
            lastReply:
                'Dernière réponse il y a 1 heure', // Placeholder pour la dernière réponse
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiscussionScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class DiscussionCard extends StatelessWidget {
  final String title;
  final String author;
  final String lastReply;
  final VoidCallback onTap;

  DiscussionCard({
    required this.title,
    required this.author,
    required this.lastReply,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(author),
        trailing: Text(lastReply),
        onTap: onTap,
      ),
    );
  }
}

class DiscussionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:
                  10, // Placeholder pour le nombre de messages dans la discussion
              itemBuilder: (context, index) {
                return MessageTile(
                  message: 'Message $index',
                  author: 'Auteur du message',
                  time: '12:00', // Placeholder pour l'heure du message
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Écrire une réponse...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Action pour envoyer la réponse
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final String author;
  final String time;

  MessageTile({
    required this.message,
    required this.author,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      subtitle: Text(author + ' - ' + time),
    );
  }
}
