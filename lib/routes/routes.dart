import 'package:sqlite/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final List<Map<String, dynamic>> _routeDefinitions = [
    {'name': 'home', 'widget': const HomeScreen()},
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    for (var route in _routeDefinitions)
      route['name']: (context) => route['widget'] as Widget,
  };
}
