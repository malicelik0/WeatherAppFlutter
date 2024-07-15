import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather_app/utils/constants.dart';


@RoutePage()
class WeatherDetailPage extends StatelessWidget {
  final Weather weather;

  const WeatherDetailPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF202B3B),
      ),
      body: Container(
        color: Color(0xFF0B131E),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(child: Text(weather.cityName, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Center(child: Text(weather.description, style: TextStyle(color: Colors.white70, fontSize: 18))),
            SizedBox(height: 20),
            Center(child: Icon(getWeatherIcon(weather.description), color: Colors.orange, size: 100)),
            SizedBox(height: 20),
            Center(child: Text('${weather.temperature.toInt()}°', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold))),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildInfoCard('MIN TEMP', '${weather.tempMin.toInt()}°')),
                SizedBox(width: 10),
                Expanded(child: _buildInfoCard('MAX TEMP', '${weather.tempMax.toInt()}°')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildInfoCard('FEELS LIKE', '${weather.feelsLike.toInt()}°')),
                SizedBox(width: 10),
                Expanded(child: _buildInfoCard('HUMIDITY', '${weather.humidity}%')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildInfoCard('WIND', '${weather.windSpeed} km/h')),
                SizedBox(width: 10),
                Expanded(child: _buildInfoCard('PRESSURE', '${weather.pressure} hPa')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildInfoCard('VISIBILITY', '${weather.visibility / 1000} km')),
                SizedBox(width: 10),
                Expanded(child: _buildInfoCard('CLOUDS', '${weather.clouds}%')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// _buildInfoCard
  Widget _buildInfoCard(String label, String value) {
    return Card(
      color: Color(0xFF202B3B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 10),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
