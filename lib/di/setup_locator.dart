import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/weather_api_service.dart';

final getIt = GetIt.instance;


Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerLazySingleton(() => WeatherApiService());
}
