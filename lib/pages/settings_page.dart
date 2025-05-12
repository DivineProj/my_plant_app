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
  String _selectedLanguage = 'Français';
  bool _notificationsEnabled = false;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'Français';
      _notificationsEnabled = prefs.getBool('notifications') ?? false;
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _savePreference(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  void _applyTheme(bool isDarkMode) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    themeNotifier.toggleTheme(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paramètres',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), // Icône retour en blanc
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            // Langue
            Text(
              'Langue',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: ['Français', 'Anglais', 'Mina'].map((langue) {
                return DropdownMenuItem(
                  value: langue,
                  child: Text(langue, style: const TextStyle(fontFamily: 'Poppins')),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                _savePreference('language', value);
              },
            ),
            const SizedBox(height: 30),

            // Notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activer les notifications',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: textColor),
                ),
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

            // Mode sombre
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mode sombre',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: textColor),
                ),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                    _savePreference('darkMode', value);
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
}
