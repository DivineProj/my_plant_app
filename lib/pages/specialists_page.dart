import 'package:flutter/material.dart';

import 'chat_page.dart';

// Modèle de spécialiste
class Specialist {
  final String name;
  final String specialty;
  final String status;
  final String imagePath;
  final String email;
  final String experience;
  final String languages;
  final String description;

  Specialist({
    required this.name,
    required this.specialty,
    required this.status,
    required this.imagePath,
    required this.email,
    required this.experience,
    required this.languages,
    required this.description,
  });
}

// Page des spécialistes
class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({super.key});

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  // Liste des spécialistes avec différentes spécialités
  final List<Specialist> specialists = [
    Specialist(
      name: "Dr. Bakary Soumahoro",
      specialty: "Pharmacopée africaine",
      status: "Disponible",
      imagePath: "assets/images/specialistes/bakary.jpg",
      email: "bakary@example.com",
      experience: "10 ans",
      languages: "Français, Bambara",
      description: "Spécialiste des plantes médicinales d’Afrique de l’Ouest.",
      
    ),
    Specialist(
      name: "Dr. Mei Lin",
      specialty: "Phytothérapie chinoise",
      status: "Disponible",
      imagePath: "assets/images/specialistes/mei.jpg",
      email: "mei@example.com",
      experience: "12 ans",
      languages: "Chinois, Français",
      description: "Experte en médecine traditionnelle chinoise.",
    ),
    Specialist(
      name: "Dr. Nathalie Koffi",
      specialty: "Aromathérapie",
      status: "Disponible",
      imagePath: "assets/images/specialistes/nathalie.jpg",
      email: "nathalie@example.com",
      experience: "8 ans",
      languages: "Français, Anglais",
      description: "Utilise les huiles essentielles pour soigner naturellement.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spécialistes',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green[700],
          centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: ListView.builder(
        itemCount: specialists.length,
        itemBuilder: (context, index) {
          final specialist = specialists[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Photo du spécialiste
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(specialist.imagePath),
                      ),
                      SizedBox(width: 12),
                      // Nom et spécialité
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              specialist.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(specialist.specialty),
                          ],
                        ),
                      ),
                     Text(
  specialist.status,
  style: TextStyle(
    color: Colors.green,
    fontSize: 16,
  ),
),

                    ],
                  ),
                  SizedBox(height: 10),
                  // Détails supplémentaires
                  Text("📧 Email : ${specialist.email}"),
                  Text("🧠 Expérience : ${specialist.experience}"),
                  Text("🌍 Langues : ${specialist.languages}"),
                  Text("📝 ${specialist.description}"),
                  SizedBox(height: 10),
                  // Bouton Consulter
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      icon: Icon(Icons.chat,color: Colors.white,),
                      label: Text("Consulter",style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatPage(specialist: specialist),
                          ),
                        );
                      },
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
