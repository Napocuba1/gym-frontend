import 'package:flutter/material.dart';

@immutable
class Provider extends InheritedWidget{
  Provider({required Key key, required Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

   static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}