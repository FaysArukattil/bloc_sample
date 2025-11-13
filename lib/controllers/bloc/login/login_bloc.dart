// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(email: '', password: '')) {
    on<EmailChanged>((event, emit) {
      emit(LoginState(email: event.email, password: state.password));
    });

    on<PasswordChanged>((event, emit) {
      emit(LoginState(email: state.email, password: event.password));
    });

    on<LoginButtonPressed>((event, emit) {
      if (state.email == 'test.com' && state.password == '1234') {
        emit(
          LoginState(
            email: state.email,
            password: state.password,
            message: '✅ Login Successful!',
          ),
        );
      } else {
        emit(
          LoginState(
            email: state.email,
            password: state.password,
            message: '❌ Invalid credentials',
          ),
        );
      }
    });
  }
}
