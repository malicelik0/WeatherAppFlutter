import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_service.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WeatherViewModel extends ChangeNotifier {
  final WeatherApiService _weatherApiService = WeatherApiService();
  bool isLoading = false;
  String? error;
  List<Weather> popularCitiesWeather = [];
  List<String> recentCities = [];
  Map<String, Weather> recentCityWeather = {};


  WeatherViewModel() {
    fetchPopularCitiesWeather();
    loadRecentCities();
  }

  ///Şehirlerin hava durumu verileri
  Future<void> fetchPopularCitiesWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      List<Weather> fetchedWeather = [];
      for (String city in popularCities) {
        Weather cityWeather = await _weatherApiService.fetchWeather(city);
        fetchedWeather.add(cityWeather);
      }
      popularCitiesWeather = fetchedWeather;
      error = null;
    } catch (e) {
      error = 'Could not fetch popular cities weather data.';
    }

    isLoading = false;
    notifyListeners();
  }

  /// Son kontrol edilen şehirlerin listesi
  Future<void> loadRecentCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentCities = prefs.getStringList('recentCities') ?? [];
    await fetchWeatherForRecentCities();
    notifyListeners();
  }

  /// Son kontrol edilen şehirlerin hava durumu verilerinin çekilmesi
  Future<void> fetchWeatherForRecentCities() async {
    try {
      for (String city in recentCities) {
        Weather cityWeather = await _weatherApiService.fetchWeather(city);
        recentCityWeather[city] = cityWeather;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  /// Yeni kontrol edilen şehri kaydedilmesi ve verilerin çekilmesi
  Future<void> saveRecentCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!recentCities.contains(cityName)) {
      recentCities.add(cityName);
      await prefs.setStringList('recentCities', recentCities);
      await fetchWeatherForRecentCities();
      notifyListeners();
    }
  }


  Weather? getWeatherForCity(String cityName) {
    return recentCityWeather[cityName];
  }
}
