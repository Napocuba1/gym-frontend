import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
        body: signinBody(size, orientation),
      ),
    );
  }

  Widget signinBody(Size size, Orientation orientation){
    return Stack(
      children: <Widget>[
        signin(size, orientation)
        //TODO: loader
      ],
    );
  }

  Widget signin(Size size, Orientation orientation){
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: orientation == Orientation.portrait && size.height < 800? size.height*0.155: orientation == Orientation.portrait && size.height > 800 && size.height <1000? size.height*0.17: orientation == Orientation.portrait && size.height >1000? size.height*0.22: orientation == Orientation.landscape && size.width <1000? size.height*0.03: size.height*0.125),
        child: Column(
          children: <Widget>[
            boxSignin(size, orientation),
            // signUpButton(size, orientation)
          ],
        ),
      ),
    );
  }

  Widget boxSignin(Size size, Orientation orientation){
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: size.height*0.03, horizontal: size.width*0.05),
            margin: EdgeInsets.symmetric(vertical: size.height*0.01, horizontal: size.width*0.1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.07),
            margin: EdgeInsets.symmetric(vertical: size.height*0.037, horizontal: size.width*0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2), offset: Offset(0, 10), blurRadius: 20)
              ]
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Gimnasio', style: TextStyle(fontFamily: 'Font', fontSize: 60), textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.01),
                  Text('Iniciar sesión', style: Theme.of(context).textTheme.headline2, textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.02),
                  // getEmail(userBloc, size, orientation),
                  // SizedBox(height: size.height*0.02),
                  // getPassword(userBloc, size, orientation),
                  // SizedBox(height: size.height*0.02),
                  // forgotPassword(size, orientation),
                  // SizedBox(height: size.height*0.01),
                  // signInButton(userBloc, size, orientation),
                  // SizedBox(height: size.height*0.01),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}