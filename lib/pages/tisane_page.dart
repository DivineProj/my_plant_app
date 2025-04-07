import 'package:flutter/material.dart';

class PackTisanePage extends StatelessWidget {
  const PackTisanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centrer le titre
        title: const Text(
          'Pack de Tisane',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white, // Texte en blanc
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildTisaneCard(context, 'Digestion', Icons.local_florist, Colors.teal, 'digestion'),
            _buildTisaneCard(context, 'Relaxation', Icons.spa, Colors.purple, 'relaxation'),
            _buildTisaneCard(context, 'Énergie', Icons.bolt, Colors.orange, 'energie'),
            _buildTisaneCard(context, 'Détox', Icons.clean_hands, Colors.blue, 'detox'),
          ],
        ),
      ),
    );
  }

  Widget _buildTisaneCard(BuildContext context, String title, IconData icon, Color color, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/$routeName'); // Redirection vers une route (à définir dans main.dart)
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
