import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/disease_result_model.dart';

class PlantIdService {
  final String apiKey = 'YOUR_PLANT_ID_API_KEY';
  final String endpoint = 'https://api.plant.id/v2/identify';

  Future<DiseaseResult> identifyDisease(String base64Image) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Api-Key': apiKey,
      },
      body: jsonEncode({
        'images': [base64Image],
        'modifiers': ['crops_fast', 'similar_images'],
        'plant_language': 'en',
        'plant_details': ['common_names', 'url'],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DiseaseResult.fromJson(data['suggestions'][0]);
    } else {
      throw Exception('Failed to identify plant disease');
    }
  }
}
