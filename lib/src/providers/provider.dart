import 'package:flutter/material.dart';
import 'package:gym/src/blocs/user_bloc.dart';

class Provider extends InheritedWidget{
  Provider({Key ?key, required Widget child}): super(key: key, child: child);

  final _userBloc = UserBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

   static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());

  static UserBloc userBloc (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()!._userBloc;
  }
}