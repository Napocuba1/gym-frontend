import 'package:flutter/material.dart';
import 'package:gym/config/ui_icons.dart';
import 'package:gym/src/blocs/user_bloc.dart';
import 'package:gym/src/providers/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key ?key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _showConfirmPassword = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final userBloc = Provider.userBloc(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: signupBody(userBloc, size, orientation),
      ),
    );
  }

  Widget signupBody(UserBloc bloc, Size size, Orientation orientation){
    return Stack(
      children: <Widget>[
        signup(bloc, size, orientation),
        // loader()
      ],
    );
  }

  Widget signup(UserBloc bloc, Size size, Orientation orientation){
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: orientation == Orientation.portrait && size.height < 800? size.height*0.065: orientation == Orientation.portrait && size.height > 800 && size.height <1000? size.height*0.085: orientation == Orientation.portrait && size.height >1000? size.height*0.155: orientation == Orientation.landscape && size.width <1000? size.height*0.05: size.height*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            boxSignup(bloc, size, orientation),
            signInButton(size, orientation),
          ],
        ),
      ),
    );
  }

  Widget boxSignup(UserBloc userBloc, Size size, Orientation orientation){
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
                  Text('Gimmaso', style: TextStyle(fontFamily: 'Font', fontSize: 60), textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.01),
                  Text('Registrarse', style: Theme.of(context).textTheme.headline2, textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.3),
                  SizedBox(height: size.height*0.02),
                  getName(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  // getFirstLastName(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  getPhone(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  getEmail(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  getPassword(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  getConfirmPassword(userBloc, size, orientation),
                  SizedBox(height: size.height*0.02),
                  signUpButton(userBloc, size, orientation),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget getName(UserBloc userBloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: userBloc.nameStream,
      builder: (context, snapshot) {
        return TextFormField(
          textCapitalization: TextCapitalization.characters,
          autocorrect: true,
          style: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Nombre completo',
            hintStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2)
              )
            ),
            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.user_1, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            errorText: snapshot.hasError?snapshot.error.toString():null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: userBloc.changeName,
          // onSaved: (value) => user.firstName = value,
          validator: (value) => value!.isEmpty? 'Ingresar su nombre': null,
        );
      },
    );
  }

  Widget getPhone(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.phoneStream,
      builder: (context, snapshot) {
        return TextFormField(
          style: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Telefono',
            hintStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2)
              )
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.phone_call, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            errorText: snapshot.hasError? snapshot.error.toString():null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: bloc.changePhone,
          // onSaved: (value) => user.email = value,
          validator: (value) => value!.isEmpty? 'Ingresar su telefono': null,
        );
      },
    );
  }

  Widget getEmail(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.emailStream,
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
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.envelope, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            errorText: snapshot.hasError? snapshot.error.toString():null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: bloc.changeEmail,
          // onSaved: (value) => user.email = value,
          validator: (value) => value!.isEmpty? 'Ingresar su correo electronico': null,
        );
      },
    );
  }

  Widget getPassword(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.passwordStream,
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
            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.padlock_1,color: snapshot.error == null ?Theme.of(context).hintColor: Theme.of(context).errorColor),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              color: snapshot.data == null? Theme.of(context).hintColor.withOpacity(0.4): Theme.of(context).errorColor,
              icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility, color: snapshot.error == null ?Theme.of(context).hintColor: Theme.of(context).errorColor, ),
            ),
            errorText: snapshot.hasError? snapshot.error.toString(): null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: bloc.changePassword,
          // onSaved: (value)=>user.password = value,
          validator: (value) => value!.isEmpty? 'Ingresar contraseña': null,
        );
      },
    );
  }

  Widget getConfirmPassword(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.confirmPasswordStream,
      builder: (context, snapshot) {
        return TextFormField(
          style: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
          keyboardType: TextInputType.text,
          obscureText: !_showConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Confirmar contraseña',
            hintStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).hintColor, fontSize: 18)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2)
              )
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
            prefixIcon: Icon(UiIcons.padlock_1, color: snapshot.error == null ? Theme.of(context).hintColor: Theme.of(context).errorColor),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
              color: Theme.of(context).hintColor.withOpacity(0.4),
              icon: Icon(_showConfirmPassword ? Icons.visibility_off : Icons.visibility, color: snapshot.error == null? Theme.of(context).hintColor: Theme.of(context).errorColor),
            ),
            errorText: snapshot.hasError? snapshot.error.toString(): null,
            errorStyle: orientation == Orientation.portrait && size.height <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): orientation == Orientation.landscape && size.width <1000? Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor)): Theme.of(context).textTheme.bodyText2!.merge(TextStyle(color: Theme.of(context).errorColor, fontSize: 16)),
          ),
          onChanged: bloc.changeConfirmPassword,
          // onSaved: (value) => user.confirmPassword = value,
          validator: (value) => value!.isEmpty? 'Ingresar su contraseña': null,
        );
      },
    );
  }

  Widget signUpButton(UserBloc bloc, Size size, Orientation orientation){
    return StreamBuilder(
      stream: bloc.formSignupValidStream,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: (){},//snapshot.hasData? () =>submit(user): null,
          child: Text('Registrarse', textScaleFactor: orientation == Orientation.portrait && size.height <1000? 1.0: orientation == Orientation.landscape && size.width <1000? 1.0: 1.2, style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Theme.of(context).primaryColor)),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.16),
            primary: Theme.of(context).colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
        );
      },
    );
  }

  Widget signInButton(Size size, Orientation orientation){
    return TextButton(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Theme.of(context).primaryColor)),
          children: [
            TextSpan(text: 'Ya tienes una cuenta?', style: orientation == Orientation.portrait && size.height <1000? TextStyle(fontSize: 16): orientation == Orientation.landscape && size.width <1000? TextStyle(fontSize: 16): TextStyle(fontSize: 20)),
            TextSpan(text: 'Ingresar', style: orientation == Orientation.portrait && size.height <1000? TextStyle(fontSize: 16, fontWeight: FontWeight.w700): orientation == Orientation.landscape && size.width <1000? TextStyle(fontSize: 16, fontWeight: FontWeight.w700): TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ] 
        ),
      ),
      onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false), 
    );
  }
}