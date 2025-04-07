import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../theme_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'Français'; // Langue par défaut
  bool _notificationsEnabled = false; // Notifications désactivées par défaut
  bool _isDarkMode = false; // Mode clair par défaut

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Charger les paramètres sauvegardés
  }

  // Charger les préférences enregistrées
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'Français';
      _notificationsEnabled = prefs.getBool('notifications') ?? false;
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  // Sauvegarder une préférence
  Future<void> _savePreference(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres', style: TextStyle(fontFamily: 'Poppins',color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sélecteur de langue
            Text('Langue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: ['Français', 'Anglais', 'Mina'].map((langue) {
                return DropdownMenuItem(value: langue, child: Text(langue));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                _savePreference('language', value);
              },
            ),
            const SizedBox(height: 20),

            // Paramètre de notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Activer les notifications', style: TextStyle(fontSize: 18)),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                    _savePreference('notifications', value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Paramètre mode sombre
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode sombre', style: TextStyle(fontSize: 18)),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                    _savePreference('darkMode', value);
                    // Appliquer le mode sombre à toute l'application
                    _applyTheme(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _applyTheme(bool isDarkMode) {
  final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
  themeNotifier.toggleTheme(isDarkMode);
}
}
