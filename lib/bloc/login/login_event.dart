part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email, password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class GoogleButtonPressed extends LoginEvent {}

class SignupButtonPressed extends LoginEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const SignupButtonPressed({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        password,
      ];

  @override
  String toString() =>
      'SignupButtonPressed { firstName: $firstName, email: $email }';
}

class LogoutButtonPressed extends LoginEvent {}
