import 'package:gym/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc with Validators{
  final _loadUserController = BehaviorSubject<bool>();

  final _nameController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _statusController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream.transform(validateName);
  Stream<String> get addressStream => _addressController.stream.transform(validateName);
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get phoneStream => _phoneController.stream.transform(validatePhone); 
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream.transform(validatePassword);
  Stream<String> get statusStream => _statusController.stream.transform(validatePassword);

  Stream<bool> get formLoginValidStream => CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);
  Stream<bool> get formSignupValidStream => CombineLatestStream.combine4(nameStream, emailStream, passwordStream, confirmPasswordStream, (n, e, p, cp) => true);

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeAddress => _addressController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeConfirmPassword => _confirmPasswordController.sink.add;
  Function(String) get changeStatus => _statusController.sink.add;

  String get name => _nameController.value;
  String get address => _addressController.value;
  String get email => _emailController.value;
  String get phone => _phoneController.value;
  String get password => _passwordController.value;
  String get confirmPassword => _confirmPasswordController.value;
  String get status => _phoneController.value;


  dispose(){
    _nameController.close();
    _addressController.close();
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _phoneController.close();
    _loadUserController.close();
  }
}