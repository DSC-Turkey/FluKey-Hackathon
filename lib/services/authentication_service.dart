import 'package:flukey_hackathon/model/user_model.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  Future<UserModel> signIn({@required String email, @required String password});
  Future<UserModel> signUp({@required String email, @required String password});
  Future<void> logOut();
  Future<UserModel> singInWithGoogle();
  bool isUserSignedIn();
  Future<UserModel> getUser();
}
