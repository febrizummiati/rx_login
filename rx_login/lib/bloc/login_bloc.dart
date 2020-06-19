import 'package:rxdart/rxdart.dart';
import 'package:rxlogin/bloc/validators.dart';

class LoginBloc with Validators{
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get username => _usernameController.stream.transform(validateUsername);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get isValid => CombineLatestStream.combine2(username, password, (username, password) => true);

  Function(String) get onChangeUsername => _usernameController.sink.add;
  Function(String) get onChangePassword => _passwordController.sink.add;

  void login(){
    final validUsername = _usernameController.value;
    final validPassword = _passwordController.value;

    print("Username is $validUsername, and password is $validPassword");
  }
}

final loginBloc = LoginBloc();

