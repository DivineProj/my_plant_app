// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.50.168:8000/api';

  // 🔹 Méthode pour récupérer les plantes
  Future<List<dynamic>> fetchPlantes() async {
    final response = await http.get(Uri.parse('$baseUrl/plantes'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['data']['data']; // Si pagination Laravel
    } else {
      throw Exception('Échec de la récupération des plantes');
    }
  }

  // 🔹 Méthode pour récupérer les packs de tisanes
  Future<List<dynamic>> fetchPacks() async {
    final response = await http.get(Uri.parse('$baseUrl/packs'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['data']['data']; // ou simplement jsonData['data'] selon ton API
    } else {
      throw Exception('Échec de la récupération des packs');
    }
  }
}
