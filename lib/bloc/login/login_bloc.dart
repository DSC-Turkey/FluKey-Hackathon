import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flukey_hackathon/bloc/authentication/authentication_bloc.dart';
import 'package:flukey_hackathon/common/auth_exception.dart';
import 'package:flukey_hackathon/services/firebase_service.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthService _authService;
  final AuthenticationBloc _authBloc;

  LoginBloc(FirebaseAuthService authService, AuthenticationBloc authBloc)
      : _authService = authService,
        _authBloc = authBloc,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      try {
        yield LoginLoading();
        final user = await _authService.signIn(
            email: event.email, password: event.password);
        _authBloc.add(AuthenticationLoggedIn(user: user));
        yield LoginInitial();
      } on LogInWithEmailFailure catch (e) {
        LoginFailure(error: e.toString());
      }
    } else if (event is GoogleButtonPressed) {
      try {
        yield LoginLoading();
        final user = await _authService.singInWithGoogle();
        _authBloc.add(AuthenticationLoggedIn(user: user));
        yield LoginInitial();
      } on LogInWithGoogleFailure catch (e) {
        LoginFailure(error: e.toString());
      }
    } else if (event is SignupButtonPressed) {
      try {
        yield LoginLoading();
        final user = await _authService.signUp(
          email: event.email,
          firstName: event.firstName,
          lastName: event.lastName,
          password: event.password,
        );
        _authBloc.add(AuthenticationLoggedIn(user: user));
        yield LoginInitial();
      } on SignUpFailure catch (e) {
        LoginFailure(error: e.toString());
      }
    }
  }
}
