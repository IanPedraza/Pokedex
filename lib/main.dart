import 'package:flutter/material.dart';
import 'package:pokemon_app/utils/routes.dart';
import 'package:pokemon_app/utils/strings.dart';
import 'package:pokemon_app/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_name,
      theme: light,
      initialRoute: home_route,
      routes: getApplicationRoutes(),
    );
  }
}
