import 'dart:convert';

import 'user_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ServiceTakerModel implements UserModel {
  final int? id;
  final String user;
  final String password;
  final int profileType;
  final String cnpj;
  final String companyName;
  final String phone;
  final String email;
  final String zip;
  final String number;
  final bool active;
  ServiceTakerModel({
    this.id,
    required this.user,
    required this.password,
    required this.profileType,
    required this.cnpj,
    required this.companyName,
    required this.phone,
    required this.email,
    required this.zip,
    required this.number,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'password': password,
      'profileType': profileType,
      'cnpj': cnpj,
      'companyName': companyName,
      'phone': phone,
      'email': email,
      'zip': zip,
      'number': number,
      'active': active,
    };
  }

  factory ServiceTakerModel.fromMap(Map<String, dynamic> map) {
    return ServiceTakerModel(
      id: map['id'] != null ? map['id'] as int : null,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      profileType: (map['profileType'] ?? 0) as int,
      cnpj: (map['cnpj'] ?? '') as String,
      companyName: (map['companyName'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      zip: (map['zip'] ?? '') as String,
      number: (map['number'] ?? '') as String,
      active: map['active'] != null
          ? map['active'] == 1
              ? true
              : false
          : false,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ServiceTakerModel.fromJson(String source) =>
      ServiceTakerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ServiceTakerModel copyWith({
    int? id,
    String? user,
    String? password,
    int? profileType,
    String? cnpj,
    String? companyName,
    String? phone,
    String? email,
    String? zip,
    String? number,
    bool? active,
  }) {
    return ServiceTakerModel(
      id: id ?? this.id,
      user: user ?? this.user,
      password: password ?? this.password,
      profileType: profileType ?? this.profileType,
      cnpj: cnpj ?? this.cnpj,
      companyName: companyName ?? this.companyName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      zip: zip ?? this.zip,
      number: number ?? this.number,
      active: active ?? this.active,
    );
  }
}
