import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/config/colors_theme.dart';

class Reservation extends StatefulWidget {
  Reservation({Key? key}) : super(key: key);

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: size.height*0.01),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        separatorBuilder: (context, index) {
          return SizedBox(height: size.height*0.01);
        }, 
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ()=>print('holi'),
            child: Container(
              height: size.height*0.12,
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).hintColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 12,
                    offset: Offset(0, 6)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Aerobicos', style: TextStyle(fontFamily: 'Font', fontSize: 60, color: Colors.white), textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                ],
              ),
            ),
          );
        }, 
      ),
    );
  }
}