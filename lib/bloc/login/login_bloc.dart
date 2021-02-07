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

  LoginBloc(
      {@required FirebaseAuthService authService,
      @required AuthenticationBloc authBloc})
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
        yield SignupSuccess();
      } on LogInWithEmailFailure {
        yield LoginFailure(error: 'Email or password is invalid.');
      }
    } else if (event is GoogleButtonPressed) {
      try {
        yield LoginLoading();
        final user = await _authService.singInWithGoogle();
        _authBloc.add(AuthenticationLoggedIn(user: user));
        yield SignupSuccess();
      } on LogInWithGoogleFailure {
        yield LoginFailure(error: 'Google sign in is failed.');
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
        yield SignupSuccess();
      } on SignUpFailure catch (e) {
        yield LoginFailure(error: e.toString());
      }
    } else if (event is LogoutButtonPressed) {
      try {
        await _authService.logOut();
        _authBloc.add(AuthenticationLoggedOut());
        yield LogOutState();
      } on LogOutFailure catch (e) {
        yield LoginFailure(error: e.toString());
      }
    }
  }
}
