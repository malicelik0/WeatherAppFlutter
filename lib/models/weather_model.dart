class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int visibility;
  final int clouds;
  final String icon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.visibility,
    required this.clouds,
    required this.icon,
  });
  ///JSON decode
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      pressure: json['main']['pressure'],
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      visibility: json['visibility'],
      clouds: json['clouds']['all'],
      icon: json['weather'][0]['icon'],
    );
  }
}
