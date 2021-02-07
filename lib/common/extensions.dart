import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flukey_hackathon/model/user_model.dart';
import 'package:flutter/material.dart';

extension UserExtension on firebase_auth.User {
  UserModel toUser({String firstName, String lastName}) {
    final userEmpty = UserModel.empty;

    final user = userEmpty.copyWith(firstName: firstName, lastName: lastName, id: uid, email: email);

    return user;
  }
}

extension SizeExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;

  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicWidth(0.01);

  double get mediumValue => dynamicWidth(0.05);

  double get largeValue => dynamicWidth(0.1);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
}
