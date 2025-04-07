// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class PlantApiService {
//   static const String _apiKey = "7joEmcmNtCqpyh56Oefg09noF0OoQmTcWYPmdRmlV9CH1XQnOJ";
//   static const String _apiUrl = "https://plant.id/api/v3";

//   static Future<String?> identifyPlant(File imageFile) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(_apiUrl))
//         ..headers['Content-Type'] = 'application/json'
//         ..fields['api_key'] = _apiKey
//         ..files.add(await http.MultipartFile.fromPath('images', imageFile.path));

//       var response = await request.send();
//       if (response.statusCode == 200) {
//         String responseBody = await response.stream.bytesToString();
//         var data = jsonDecode(responseBody);
//         return data['suggestions'][0]['plant_name'];
//       } else {
//         print("Erreur: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("Erreur lors de l'identification: $e");
//       return null;
//     }
//   }
// }
