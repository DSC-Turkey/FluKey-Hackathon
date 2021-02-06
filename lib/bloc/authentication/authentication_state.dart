part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationUnauhenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}
