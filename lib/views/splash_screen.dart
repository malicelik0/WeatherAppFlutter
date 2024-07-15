import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../app_router.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      context.router.replace(const HomeRoute());
    });

    return Scaffold(
      body: Center(
        child: Text('Weather App', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
