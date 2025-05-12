import 'package:flutter/material.dart';

class FormationsPage extends StatelessWidget {
   const FormationsPage({super.key});

  void payerAvecPayPal(BuildContext context, String titreFormation) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Paiement PayPal"),
        content: Text("Souhaitez-vous payer « $titreFormation » avec PayPal ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // bouton vert
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Paiement PayPal simulé avec succès !")),
              );
              // Ici, tu pourras ajouter l'appel à une vraie API PayPal
            },
            child: const Text("Payer avec PayPal"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formations',style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,   centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FormationCard(
              image: 'assets/images/formations/formation1.jpg',
              title: 'Reconnaissance des plantes médicinales',
              formateur: 'Dr. GADABO René',
              date: '12 Mai 2025',
              heure: '09h00',
              prix: '5 000 FCFA',
              onPressed: () => payerAvecPayPal(context, 'Reconnaissance des plantes médicinales'),
            ),
            FormationCard(
              image: 'assets/images/formations/formation2.jpg',
              title: 'Préparation des tisanes efficaces',
              formateur: 'Dr. Ekoué Hounkpati',
              date: '15 Mai 2025',
              heure: '14h00',
              prix: '7 500 FCFA',
              onPressed: () => payerAvecPayPal(context, 'Préparation des tisanes efficaces'),
            ),
            FormationCard(
              image: 'assets/images/formations/formation3.jpg',
              title: 'Booster l’immunité avec les plantes',
              formateur: 'Dr. Ahouansou Mireille',
              date: '20 Mai 2025',
              heure: '10h30',
              prix: '10 000 FCFA',
              onPressed: () => payerAvecPayPal(context, 'Booster l’immunité avec les plantes'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormationCard extends StatelessWidget {
  final String image, title, formateur, date, heure, prix;
  final VoidCallback onPressed;

  const FormationCard({
    super.key,
    required this.image,
    required this.title,
    required this.formateur,
    required this.date,
    required this.heure,
    required this.prix,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, width: double.infinity, height: 160, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Formateur : $formateur'),
            Text('Date : $date'),
            Text('Heure : $heure'),
            Text('Prix : $prix'),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
  'Prendre un ticket',
  style: TextStyle(color: Colors.white),
),
      
              ),
            ),
          ],
        ),
      ),
    );
  }
}
