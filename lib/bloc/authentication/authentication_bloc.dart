import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flukey_hackathon/model/user_model.dart';
import 'package:flukey_hackathon/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthService _authService;

  AuthenticationBloc({@required FirebaseAuthService authService})
      : _authService = authService,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      final isSignIn = await _authService.isUserSignedIn();
      if (isSignIn) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationFailure();
      }
    } else if (event is AuthenticationLoggedIn) {
      yield AuthenticationAuthenticated();
    } else if (event is AuthenticationLoggedOut) {
      yield AuthenticationUnAuthenticated();
    }
  }
}
