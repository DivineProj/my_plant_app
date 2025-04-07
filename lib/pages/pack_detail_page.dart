import 'package:flutter/material.dart';

class PackDetailPage extends StatelessWidget {
  final String title;

  const PackDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Contenu du $title',
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 18),
        ),
      ),
    );
  }
}
