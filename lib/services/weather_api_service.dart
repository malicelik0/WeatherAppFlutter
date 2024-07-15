import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherApiService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = 'd354449382e60c30ed734385e42f6a5c';

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
