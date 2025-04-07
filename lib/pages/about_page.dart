import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos', style: TextStyle(fontFamily: 'Poppins', color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.local_florist, size: 80, color: Colors.green),
            const SizedBox(height: 10),
            const Text(
              'Plantes Médicinales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Une application pour découvrir, reconnaître et utiliser les plantes médicinales.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 14, fontFamily: 'Poppins', color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Développé par : [Votre Nom]',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://www.votre-site.com')),
              child: const Text(
                'Visitez notre site web',
                style: TextStyle(fontSize: 16, color: Colors.blue, fontFamily: 'Poppins', decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://www.github.com/votre-projet')),
              child: const Text(
                'Voir le projet sur GitHub',
                style: TextStyle(fontSize: 16, color: Colors.blue, fontFamily: 'Poppins', decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
