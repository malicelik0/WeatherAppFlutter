import 'package:flutter/material.dart';

const List<String> popularCities = [
  'London',
  'New York',
  'Tokyo',
  'Paris',
  'Istanbul',
  'Dubai',
  'Singapore',
  'Rome',
  'Bangkok',
  'Hong Kong'
];

IconData getWeatherIcon(String description) {
  switch (description.toLowerCase()) {
    case 'clear':
    case 'clear sky':
      return Icons.wb_sunny;
    case 'few clouds':
    case 'scattered clouds':
    case 'broken clouds':
      return Icons.wb_cloudy;
    case 'shower rain':
    case 'rain':
    case 'light rain':
      return Icons.beach_access;
    case 'thunderstorm':
      return Icons.flash_on;
    case 'snow':
      return Icons.ac_unit;
    case 'mist':
      return Icons.grain;
    default:
      return Icons.wb_sunny;
  }
}
