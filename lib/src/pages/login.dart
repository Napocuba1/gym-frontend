import 'package:flutter/material.dart';
import 'package:gym/config/ui_icons.dart';
import 'package:gym/src/blocs/user_bloc.dart';
import 'package:gym/src/providers/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    final userBloc = Provider.userBloc(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: signinBody(userBloc, size, orientation),
      ),
    );
  }

  Widget signinBody(UserBloc userBloc, Size size, Orientation orientation){
    return Stack(
      children: <Widget>[
        signin(userBloc, size, orientation)
        //TODO: loader
      ],
    );
  }

  Widget signin(UserBloc userBloc, Size size, Orientation orientation){
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: orientation == Orientation.portrait && size.height < 800? size.height*0.155: orientation == Orientation.portrait && size.height > 800 && size.height <1000? size.height*0.17: orientation == Orientation.portrait && size.height >1000? size.height*0.22: orientation == Orientation.landscape && size.width <1000? size.height*0.03: size.height*0.125),
        child: Column(
          children: <Widget>[
            boxSignin(userBloc, size, orientation),
            // signUpButton(size, orientation)
          ],
        ),
      ),
    );
  }

  Widget boxSignin(UserBloc userBloc, Size size, Orientation orientation){
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
                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2), offset: const Offset(0, 10), blurRadius: 20)
              ]
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Gimnasio', style: const TextStyle(fontFamily: 'Font', fontSize: 60), textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.01),
                  Text('Iniciar sesión', style: Theme.of(context).textTheme.headline2, textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.02),
                  getEmail(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  getPassword(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  // forgotPassword(size, orientation),
                  SizedBox(height: size.height*0.01),
                  signInButton(userBloc, size, orientation),
                  SizedBox(height: size.height*0.01),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget getEmail(UserBloc userBloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: userBloc.emailStream,
      builder: (context, snapshot) {
        return TextFormField(
          style: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Correo Electronico',
            hintStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2)
              )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor
              )
            ),
            prefixIcon: Icon(UiIcons.envelope, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            errorText: snapshot.hasError? snapshot.error.toString(): null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: userBloc.changeEmail,
          // onSaved: (value) => user.email = value,
          validator: (value) => value!.isEmpty? 'Ingresar correo electronico': null,
        );
      },
    );
  }

  Widget getPassword(UserBloc userBloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: userBloc.passwordStream,
      builder: (context, snapshot) {
        return TextFormField(
          style: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
          keyboardType: TextInputType.text,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            hintStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2)
              )
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.padlock_1, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              color: Theme.of(context).hintColor.withOpacity(0.4),
              icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility, color: snapshot.error == null? Theme.of(context).hintColor:Theme.of(context).errorColor),
            ),
          ),
          onChanged: userBloc.changePassword,
          // onSaved: (value) => user.password = value,
          validator: (value) => value!.isEmpty? 'Ingrese su contraseña': null,
        );
      },
    );
  }

  Widget signInButton(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.formLoginValidStream,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/Tabs', (route) => false, arguments: 1), 
          // onPressed: (){},//snapshot.hasData? () => submit(user): null,
          child: Text('Iniciar sesión', style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Theme.of(context).primaryColor)), textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.2),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.16),
            primary: Theme.of(context).colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
        );
      },
    );
  }
}