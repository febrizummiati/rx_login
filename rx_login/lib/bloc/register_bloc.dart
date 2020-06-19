import 'package:rxdart/rxdart.dart';
import 'package:rxlogin/bloc/validators.dart';

class RegisterBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _nimController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email =>
      _emailController.stream.transform(validateUsername);

  Stream<String> get nim => _nimController.stream.transform(validateNim);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get isValid =>
      CombineLatestStream.combine3( email, nim, password,( email, nim, password,) => true);
  Function(String) get onChangeEmail => _emailController.sink.add;

  Function(String) get onChangeNim => _nimController.sink.add;

  Function(String) get onChangePassword => _passwordController.sink.add;


  void register() {
    final validEmail = _emailController.value;
    final validNim = _nimController.value;
    final validPassword = _passwordController.value;
  }
}

final registerBloc = RegisterBloc();

