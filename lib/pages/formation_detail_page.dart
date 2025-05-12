import 'package:flutter/material.dart';

class FormationDetailPage extends StatelessWidget {
  final Map<String, String> formation;

  const FormationDetailPage({super.key, required this.formation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(formation['titre']!))
      
      ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formation['titre']!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('👤 Spécialiste : ${formation['specialiste']}'),
            Text('🗓 Date : ${formation['date']}'),
            Text('📍 Lieu : ${formation['lieu']}'),
            Text('💵 Prix : ${formation['prix']}'),
            SizedBox(height: 20),
            Text(formation['description']!, style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Inscription réussie ! Ticket envoyé.')),
                  );
                },
                child: Text('S\'inscrire à cette formation'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
