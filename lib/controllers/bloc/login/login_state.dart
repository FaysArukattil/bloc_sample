part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isloading;
  final bool isSuccess;
  final String? error;

  LoginState({
    required this.email,
    required this.password,
    required this.isloading,
    required this.isSuccess,
    this.error,
  });

  factory LoginState.initial() {
    return LoginState(
      email: "",
      password: "",
      isloading: false,
      isSuccess: false,
      error: null,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isvalidemail,
    bool? isvalidpassord,
    bool? isloading,
    bool? isSuccess,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,

      isloading: isloading ?? this.isloading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

final class LoginInitial extends LoginState {
  LoginInitial({
    required super.email,
    required super.password,
    required super.isloading,
    required super.isSuccess,
  });
}
