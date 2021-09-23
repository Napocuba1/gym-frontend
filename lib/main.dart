import 'package:flutter/material.dart';
import 'package:gym/config/colors_theme.dart';
import 'package:gym/route_generator.dart';
import 'package:gym/src/providers/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Home',
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Gimnasio',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            primary: Colors.white,
            secondary: ColorsTheme().mainColor(1)
          ),
          focusColor: ColorsTheme().accentColor(1),
          hintColor: ColorsTheme().secondColor(1),
          disabledColor: ColorsTheme().secondColor(1),
          snackBarTheme: const SnackBarThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
          textTheme: TextTheme(
            button: const TextStyle(color: Colors.white),
            headline5: TextStyle(fontSize: 18.0, color: ColorsTheme().secondColor(1)),
            headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: ColorsTheme().secondColor(1)),
            headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: ColorsTheme().secondColor(1)),
            headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: ColorsTheme().mainColor(1)),
            headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color: ColorsTheme().secondColor(1)),
            subtitle1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: ColorsTheme().secondColor(1)),
            headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: ColorsTheme().mainColor(1)),
            bodyText2: TextStyle(fontSize: 14.0, color: ColorsTheme().secondColor(1)),
            bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: ColorsTheme().secondColor(1)),
            caption: TextStyle(fontSize: 12.0, color: ColorsTheme().secondColor(0.6)),
          ),
        ),
      ),
    );
  }
}