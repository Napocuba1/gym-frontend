import 'package:flutter/material.dart';
import 'package:gym/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Gimnasio',
      theme: ThemeData(
        
      ),
    );
  }
}