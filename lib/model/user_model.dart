import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int numOfTicket;
  final int spentTickets;

  const UserModel({
    @required this.id,
    @required this.email,
    this.firstName,
    this.lastName,
    this.numOfTicket,
    this.spentTickets,
  });

  static const empty = UserModel(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      numOfTicket: 0,
      spentTickets: 0);

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      numOfTicket,
      spentTickets,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'numOfTicket': numOfTicket,
      'spentTickets': spentTickets,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      numOfTicket: map['numOfTicket'],
      spentTickets: map['spentTickets'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String id,
    String firstName,
    String lastName,
    String email,
    int numOfTicket,
    int spentTickets,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      numOfTicket: numOfTicket ?? this.numOfTicket,
      spentTickets: spentTickets ?? this.spentTickets,
    );
  }
}
