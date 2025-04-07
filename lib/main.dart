import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_notifier.dart';
import 'pages/splash_screen.dart';
import 'pages/home_screen.dart';
import 'pages/compte_page.dart';
import 'pages/tisane_page.dart';
import 'pages/pack_detail_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Plantes Médicinales',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            fontFamily: 'Poppins',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
            colorScheme: const ColorScheme.dark(
              primary: Colors.green,
            ),
          ),
          themeMode: themeNotifier.themeMode,
          home: const SplashScreen(),
          routes: {
            '/home': (context) => const HomeScreen(),
            '/pack': (context) => const PackTisanePage(),
            '/compte': (context) => const ComptePage(),
            '/digestion': (context) => const PackDetailPage(title: 'Digestion'),
            '/relaxation': (context) => const PackDetailPage(title: 'Relaxation'),
            '/energie': (context) => const PackDetailPage(title: 'Énergie'),
            '/detox': (context) => const PackDetailPage(title: 'Détox'),
          },
        );
      },
    );
  }
}
