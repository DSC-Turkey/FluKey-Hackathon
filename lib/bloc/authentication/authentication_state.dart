part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserModel user;
  AuthenticationAuthenticated({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}

class AuthenticationUnAuthenticated extends AuthenticationState {}
