
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CommandePage extends StatelessWidget {
  final String nomPack;

  const CommandePage({super.key, required this.nomPack});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nomController = TextEditingController();
    final TextEditingController telController = TextEditingController();
    final TextEditingController adresseController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Commander $nomPack'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Veuillez remplir les informations pour commander ce pack.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom complet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer votre nom' : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: telController,
                decoration: const InputDecoration(
                  labelText: 'Téléphone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer un numéro' : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: adresseController,
                decoration: const InputDecoration(
                  labelText: 'Adresse',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer une adresse' : null,
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Action de commande ici (envoyer à Firebase, API, etc.)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Commande envoyée avec succès !')),
                    );
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.send),
                label: Text("Valider la commande"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
