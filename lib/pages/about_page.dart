import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _launchWebsite() async {
    const url = 'https://www.votre-site.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Impossible d\'ouvrir le site $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('À propos',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.local_florist, size: 100, color: Colors.green),
            const SizedBox(height: 10),
            const Text(
              'Plantes Médicinales',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Votre guide numérique pour découvrir, reconnaître et bénéficier des vertus des plantes médicinales, grâce à la reconnaissance intelligente et à la recommandation de tisanes adaptées.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.info_outline, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Développé par :',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'GADABO René & ETOUNDE Divine',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _launchWebsite,
              icon: const Icon(Icons.link),
              label: const Text(
                'Visitez notre site web',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
