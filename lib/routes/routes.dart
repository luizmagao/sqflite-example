import 'package:sqlite/screens/add_screen.dart';
import 'package:sqlite/screens/home_screen.dart';
import 'package:sqlite/screens/edit_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final List<Map<String, dynamic>> _routeDefinitions = [
    {'name': 'home', 'widget': const HomeScreen()},
    {'name': 'add_person', 'widget': const AddScreen()},
    {'name': 'edit_person', 'widget': const EditScreen()},
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    for (var route in _routeDefinitions)
      route['name']: (context) => route['widget'] as Widget,
  };
}
