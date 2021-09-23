import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern.toString());

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Correo electronico incorrecto');
      }
    }
  );

  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      Pattern pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚ ]+$';
      RegExp regExp = RegExp(pattern.toString());
      if(regExp.hasMatch(name)){
        sink.add(name);
      }else{
        sink.addError('Nombre incorrecto');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length>=6){
        sink.add(password);
      }else{
        sink.addError('Ingresar más de 6 caracteres');
      }
    }
  );


  final validatePhone = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink){
      Pattern pattern = r'^[0-9]+$';
      RegExp regExp = RegExp(pattern.toString());
      if(regExp.hasMatch(phone)){
        if(phone.length == 8){
          sink.add(phone);
        }else{
          sink.addError('Ingresar más de 6 números');
        }
      }else{
        sink.addError('Telefono incorrecto');
      }
    }
  );
}