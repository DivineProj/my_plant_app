import 'package:flutter/material.dart';

import '../pages/home_screen.dart'; // importe le modèle Plante


class DescriptionPlantePage extends StatelessWidget {
  final Plante plante;

  const DescriptionPlantePage({super.key, required this.plante});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plante.nom),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(plante.imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              plante.nom,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Nom scientifique : ${plante.nomScientifique}',
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 16),
            ),
            // Tu peux ajouter ici les noms en fon, minan, etc.
          ],
        ),
      ),
    );
  }
}
