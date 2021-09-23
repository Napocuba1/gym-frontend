import 'package:flutter/material.dart';
import 'package:gym/src/pages/login.dart';
import 'package:gym/src/pages/signup.dart';
import 'package:gym/src/pages/tabs.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> Login());
      case '/Tabs':
        return MaterialPageRoute(builder: (_)=> Tabs());
      case '/SignUp':
        return MaterialPageRoute(builder: (_)=> SignUp());
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