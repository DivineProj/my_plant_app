import 'package:flutter/material.dart';

import 'CommandePage.dart';

class PackTisanePage extends StatelessWidget {
   PackTisanePage({super.key});

  final List<Map<String, String>> tisanePacks =  [
    {
      "nom": "Pack Digestion",
      "effet": "Améliore la digestion et réduit les ballonnements.",
      "prix": "3 500 FCFA",
      "composition": "Feuilles de menthe, gingembre, verveine, citronnelle",
       "image":"assets/images/digestion.jpg"
      
    },
    {
      "nom": "Pack Relaxation",
      "effet": "Apaise le stress et favorise la détente.",
      "prix": "4 000 FCFA",
      "composition": "Fleurs de lavande, camomille, mélisse",
      "image": "assets/images/relaxation.jpg"
    },
    {
      "nom": "Pack Énergie",
      "effet": "Redonne de l’énergie et combat la fatigue.",
      "prix": "3 000 FCFA",
      "composition": "Ginseng, guarana, citron, hibiscus",
      "image": "assets/images/energie.jpg"
    },
    {
      "nom": "Pack Détox",
      "effet": "Élimine les toxines et purifie l’organisme.",
      "prix": "4 500 FCFA",
      "composition": "Citronnelle, ortie, pissenlit, menthe poivrée",
      "image": "assets/images/detox.jpg"
    },
    {
      "nom": "Pack Sommeil",
      "effet": "Aide à mieux dormir naturellement.",
      "prix": "3 500 FCFA",
      "composition": "Valériane, passiflore, tilleul",
      "image": "assets/images/sommeil.jpg"
    },
    {
      "nom": "Pack Beauté",
      "effet": "Améliore la qualité de la peau et des cheveux.",
      "prix": "4 000 FCFA",
      "composition": "Rooibos, ortie, pensée sauvage",
      "image": "assets/images/beauté.jpg"
    },
    {
      "nom": "Pack Immunité",
      "effet": "Renforce les défenses naturelles.",
      "prix": "5 000 FCFA",
      "composition": "Échinacée, curcuma, gingembre, citron",
      "image": "assets/images/immunité.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Packs de Tisanes',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tisanePacks.length,
        itemBuilder: (context, index) {
          final pack = tisanePacks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ZONE POUR L’IMAGE (placeholder)
                 ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Image.asset(
    pack["image"]!,          // Chemin de l'image dans la Map
    height: 150,
    width: double.infinity,
    fit: BoxFit.cover,       // Ajuste l'image
    errorBuilder: (context, error, stackTrace) {
      // S'il y a une erreur de chargement de l'image
      return Container(
        height: 150,
        width: double.infinity,
        color: Colors.grey[200],
        child: const Center(
          child: Text(
            'Image non disponible',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    },
  ),
),

                  const SizedBox(height: 12),
                  Text(
                    pack["nom"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("🩺 Effets : ${pack["effet"]}"),
                  const SizedBox(height: 4),
                  Text("💰 Prix : ${pack["prix"]}"),
                  const SizedBox(height: 4),
                  Text("🌿 Composition : ${pack["composition"]}"),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommandePage(nomPack: pack["nom"]!),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("Commander"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
