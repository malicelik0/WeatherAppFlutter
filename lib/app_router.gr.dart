part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ExploreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExplorePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WeatherDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeatherDetailPage(
          key: args.key,
          weather: args.weather,
        ),
      );
    },
  };

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => throw UnimplementedError();
}

/// generated route for
/// [ExplorePage]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute({List<PageRouteInfo>? children})
      : super(
    ExploreRoute.name,
    initialChildren: children,
  );

  static const String name = 'ExploreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
    HomeRoute.name,
    initialChildren: children,
  );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
      : super(
    SplashScreenRoute.name,
    initialChildren: children,
  );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherDetailPage]
class WeatherDetailRoute extends PageRouteInfo<WeatherDetailRouteArgs> {
  WeatherDetailRoute({
    Key? key,
    required Weather weather,
    List<PageRouteInfo>? children,
  }) : super(
    WeatherDetailRoute.name,
    args: WeatherDetailRouteArgs(
      key: key,
      weather: weather,
    ),
    initialChildren: children,
  );

  static const String name = 'WeatherDetailRoute';

  static const PageInfo<WeatherDetailRouteArgs> page =
  PageInfo<WeatherDetailRouteArgs>(name);
}

class WeatherDetailRouteArgs {
  const WeatherDetailRouteArgs({
    this.key,
    required this.weather,
  });

  final Key? key;

  final Weather weather;

  @override
  String toString() {
    return 'WeatherDetailRouteArgs{key: $key, weather: $weather}';
  }
}
