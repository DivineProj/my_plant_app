import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/specialists_page.dart';
import '../pages/formations_page.dart';
import '../pages/settings_page.dart';
import '../pages/about_page.dart';
import '../pages/tisane_page.dart';
import '../pages/compte_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreenContent(), // Accueil
    PackTisanePage(),
    ComptePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                'My PlantApp',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
  IconButton(
    icon: const Icon(Icons.search, color: Colors.white),
    onPressed: () {
      // Pour l'instant, on ne fait rien ici.
      // Tu pourras ajouter la logique de recherche plus tard.
    },
  )
],

        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.green),
              title: const Text('Faire une formation',
                  style: TextStyle(fontFamily: 'Poppins')),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FormationsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.green),
              title: const Text('Consulter un spécialiste',
                  style: TextStyle(fontFamily: 'Poppins')),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SpecialistsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining, color: Colors.green),
              title: const Text('Livraison',
                  style: TextStyle(fontFamily: 'Poppins')),
              onTap: () {
                // Naviguer vers la page de livraison (à créer plus tard)
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.green),
              title: const Text('Paramètres',
                  style: TextStyle(fontFamily: 'Poppins')),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.green),
              title: const Text('À propos',
                  style: TextStyle(fontFamily: 'Poppins')),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AboutPage())),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Quitter',
                  style:
                      TextStyle(fontFamily: 'Poppins', color: Colors.red)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmation'),
                    content: const Text(
                        'Voulez-vous vraiment quitter l\'application ?'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Non')),
                      TextButton(
                          onPressed: () => SystemNavigator.pop(),
                          child: const Text('Oui')),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink), label: 'Pack de tisane'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
        ],
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: _selectedIndex == 0
            ? Padding(
                key: ValueKey('fab-visible'),
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    onPressed: () {
                      _showIdentificationOptions(context);
                    },
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.camera_alt,
                        size: 24, color: Colors.white),
                  ),
                ),
              )
            : const SizedBox.shrink(key: ValueKey('fab-hidden')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Plante {
  final String nom;
  final String nomScientifique;
  final String imageUrl;

  Plante({
    required this.nom,
    required this.nomScientifique,
    required this.imageUrl,
  });
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plantes = [
      {"nom": "Aloe Vera", "image": "assets/images/aloe.png"},
      {"nom": "Armoise", "image": "assets/images/armoise.png"},
      {"nom": "Basilic", "image": "assets/images/basilic.png"},
      {"nom": "Baobab", "image": "assets/images/baobab.png"},
      {"nom": "Citronnelle", "image": "assets/images/citronnelle.png"},
      {"nom": "Cajanus cajan", "image": "assets/images/cajanus_cajan.png"},
      {"nom": "Daniellia oliveri", "image": "assets/images/daniellia_oliveri.png"},
      {"nom": "Dichrostachys ", "image": "assets/images/dichrostachys_cinerea.png"},
    ];

    // Trier par ordre alphabétique
    plantes.sort((a, b) => a['nom']!.compareTo(b['nom']!));

    // Regrouper par première lettre
    final Map<String, List<Map<String, String>>> grouped = {};
    for (var plante in plantes) {
      final lettre = plante['nom']![0].toUpperCase();
      grouped.putIfAbsent(lettre, () => []).add(plante);
    }

    return ListView(
      children: grouped.entries.map((entry) {
        final lettre = entry.key;
        final listePlantes = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  lettre,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listePlantes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3.5,
              ),
              itemBuilder: (context, index) {
                final plante = listePlantes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.green,
                          title: Text(plante['nom']!,
                              style: const TextStyle(fontFamily: 'Poppins')),
                          iconTheme:
                              const IconThemeData(color: Colors.white),
                        ),
                        body: Center(
                          child: Text(
                            "Description de ${plante['nom']} ici...",
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      );
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.asset(
                            plante['image']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            plante['nom']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }).toList(),
    );
  }
}

void _showIdentificationOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 150,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choisir depuis la galerie'),
              onTap: () {
                // Action pour choisir depuis la galerie
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Prendre une photo'),
              onTap: () {
                // Action pour prendre une photo
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

