import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather_app/app_router.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';
import 'explore_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    PopularCitiesPage(),
    ExplorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF202B3B),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF202B3B),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PopularCitiesPage extends StatelessWidget {
  const PopularCitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0B131E),
      child: Consumer<WeatherViewModel>(
        // Consumer-Provider
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.error != null) {
            return Center(child: Text(viewModel.error!, style: TextStyle(color: Colors.red)));
          } else {
            return ListView.builder(
              itemCount: viewModel.popularCitiesWeather.length,
              itemBuilder: (context, index) {
                final weather = viewModel.popularCitiesWeather[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Color(0xFF202B3B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      viewModel.saveRecentCity(weather.cityName);
                      AutoRouter.of(context).push(WeatherDetailRoute(weather: weather));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(getWeatherIcon(weather.description), color: Colors.orange, size: 50),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(weather.cityName, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
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
    );
  }
}
