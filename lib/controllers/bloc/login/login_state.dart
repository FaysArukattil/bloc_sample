part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final String message;

  LoginState({required this.email, required this.password, this.message = ''});
}

class LoginInitial extends LoginState {
  LoginInitial({required super.email, required super.password});
}
