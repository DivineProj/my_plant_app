import 'package:flutter/material.dart';
import 'specialists_page.dart'; // pour importer le modèle Specialist

class ChatPage extends StatelessWidget {
  final Specialist specialist;

  const ChatPage({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat avec ${specialist.name}"),
        backgroundColor: Colors.green[700],
          centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: Center(
        child: Text(
          "Ici, vous pourrez discuter avec ${specialist.name}.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
