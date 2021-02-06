part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final UserModel user;

  AuthenticationLoggedIn({this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
