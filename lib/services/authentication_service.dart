import 'package:flutter/foundation.dart';

abstract class IAuthenticationService<T> {
  Future<T> signIn({@required String email, @required String password});
  Future<T> signUp({@required String email, @required String password});
  Future<T> singOut();
  Future<T> singInWithGoogle({String email, String password});
  T isUserSignedIn();
}
