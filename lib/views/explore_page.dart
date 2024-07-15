import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather_app/app_router.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

///Autoroute
@RoutePage()
class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0B131E),
        child: Consumer<WeatherViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.recentCities.isEmpty) {
              return Center(child: Text('No recent cities', style: TextStyle(color: Colors.white)));
            } else {
              return ListView.builder(
                itemCount: viewModel.recentCities.length,
                itemBuilder: (context, index) {
                  final cityName = viewModel.recentCities[index];
                  final weather = viewModel.getWeatherForCity(cityName);
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Color(0xFF202B3B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {///Autoroute push
                        if (weather != null) {
                          AutoRouter.of(context).push(WeatherDetailRoute(weather: weather));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cityName, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            if (weather != null)
                              Text('${weather.temperature.toInt()}°', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
