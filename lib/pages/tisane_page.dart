import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Assure-toi du bon chemin
import 'CommandePage.dart';

class PackTisanePage extends StatefulWidget {
  const PackTisanePage({super.key});

  @override
  State<PackTisanePage> createState() => _PackTisanePageState();
}

class _PackTisanePageState extends State<PackTisanePage> {
  late Future<List<dynamic>> _packsFuture;

  @override
  void initState() {
    super.initState();
    _packsFuture = ApiService().fetchPacks();
  }

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
      body: FutureBuilder<List<dynamic>>(
        future: _packsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green));
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun pack de tisane trouvé"));
          }

          final packs = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: packs.length,
            itemBuilder: (context, index) {
              final pack = packs[index];
              final imageUrl = "http://192.168.50.168:8000/storage/tisane/${pack['image']}";

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔸 Image depuis le serveur Laravel
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
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
                        pack["nom"] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("🩺 Effets : ${pack["effet"] ?? ''}"),
                      const SizedBox(height: 4),
                      Text("💰 Prix : ${pack["prix"] ?? ''} FCFA"),
                      const SizedBox(height: 4),
                      Text("🌿 Composition : ${pack["composition"] ?? ''}"),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommandePage(nomPack: pack["nom"] ?? ''),
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
          );
        },
      ),
    );
  }
}
