import 'package:flutter/material.dart';
import 'package:gym/src/pages/login.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> Login());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
            child: Text('No route defined for ${settings.name}')),
          )
        );
    }
  }
}