import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';
import 'package:weather_app/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherViewModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
