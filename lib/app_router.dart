import 'package:auto_route/auto_route.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/weather_detail_page.dart';
import 'package:weather_app/views/explore_page.dart';
import 'package:weather_app/views/splash_screen.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: WeatherDetailRoute.page),
    AutoRoute(page: ExploreRoute.page),
  ];
}
