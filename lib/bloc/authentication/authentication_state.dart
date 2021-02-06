part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationUnAuthenticated extends AuthenticationState {}
