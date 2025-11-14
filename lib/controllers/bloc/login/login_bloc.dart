// ignore: depend_on_referenced_packages
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);

    on<Login>((event, emit) {
      emit(state.copyWith(isloading: true));
      //api call
      //update setstate with copy with
      Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(isloading: false, isSuccess: true));
    });
  }

  FutureOr<void> _passwordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
