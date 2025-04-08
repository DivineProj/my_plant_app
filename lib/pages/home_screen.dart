import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/settings_page.dart';
import '../pages/about_page.dart';
import '../pages/tisane_page.dart';
import '../pages/compte_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreenContent(), // Accueil
    const PackTisanePage(),
    const ComptePage(),
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
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Plantes Médicinales',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
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
              leading: const Icon(Icons.settings, color: Colors.green),
              title: const Text('Paramètres', style: TextStyle(fontFamily: 'Poppins', color: Colors.green)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.green),
              title: const Text('À propos', style: TextStyle(fontFamily: 'Poppins', color: Colors.green)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Quitter', style: TextStyle(fontFamily: 'Poppins', color: Colors.red)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmation'),
                    content: const Text('Voulez-vous vraiment quitter l\'application ?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Non')),
                      TextButton(onPressed: () => SystemNavigator.pop(), child: const Text('Oui')),
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
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: 'Pack de tisane'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Digestive',
      'Respiratoire',
      'Stress & Sommeil',
      'Douleurs',
      'Beauté',
      'Énergie',
      'Détox',
      'Autres Plantes'
    ];

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      children: List.generate(8, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text(categories[index], style: const TextStyle(fontFamily: 'Poppins',color: Colors.white)),
                  iconTheme: const IconThemeData(color: Colors.white)
                ),
                body: Center(
                  child: Text(
                    'Page ${categories[index]} à venir...',
                    style: const TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              );
            }));
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://plantespourtous.co/cdn/shop/products/FormatEshop-2023-02-15T142213.305_1024x1024.png?v=1693832763",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  categories[index],
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
