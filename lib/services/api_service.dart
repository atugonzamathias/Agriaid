import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // 🔍 1. Detect Crop Disease with Plant.id
  Future<Map<String, dynamic>> identifyPlantDisease(String base64Image) async {
    final response = await http.post(
      Uri.parse('https://api.plant.id/v2/identify'),
      headers: {
        'Content-Type': 'application/json',
        'Api-Key': 'YOUR_PLANT_ID_API_KEY',  // store this securely
      },
      body: jsonEncode({
        'images': [base64Image],
        'organs': ['leaf'],
        'details': ['disease', 'common_names']
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to identify plant disease');
    }
  }

  // 🌱 2. Fetch Soil Data using SoilGrids API
  Future<Map<String, dynamic>> getSoilData(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('https://rest.isric.org/soilgrids/v2.0/properties/query?lat=$lat&lon=$lon'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch soil data');
    }
  }

  // 🌦️ 3. Get Weather Forecast (optional)
  Future<Map<String, dynamic>> getWeatherForecast(double lat, double lon) async {
    final apiKey = 'YOUR_WEATHER_API_KEY';
    final response = await http.get(
      Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=3'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch weather forecast');
    }
  }
}
