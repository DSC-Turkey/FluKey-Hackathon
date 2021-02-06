import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flukey_hackathon/model/user_model.dart';

extension UserExtension on firebase_auth.User {
  UserModel toUser({String firstName, String lastName}) {
    final userEmpty = UserModel.empty;

    final user = userEmpty.copyWith(
        firstName: firstName, lastName: lastName, id: uid, email: email);

    return user;
  }
}
