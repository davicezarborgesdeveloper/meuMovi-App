import 'dart:convert';

import 'user_model.dart';
import 'worker_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ServiceTakerModel implements UserModel {
  final int? id;
  final String user;
  final String password;
  final int profileType;
  final String companyName;
  final String fantasyName;
  final EmployeerModel? employeer;
  final String email;
  final String cnpj;
  final String name;
  final String? phone;
  final String zip;
  final String? number;
  final bool active;
  final String? imageUrl;
  ServiceTakerModel({
    this.id,
    required this.user,
    required this.password,
    required this.profileType,
    required this.companyName,
    required this.fantasyName,
    this.employeer,
    required this.email,
    required this.cnpj,
    required this.name,
    required this.phone,
    required this.zip,
    required this.number,
    required this.active,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'password': password,
      'profileType': profileType,
      'companyName': companyName,
      'fantasyName': fantasyName,
      'employeer': employeer?.toMap(),
      'email': email,
      'cnpj': cnpj,
      'name': name,
      'phone': phone,
      'zip': zip,
      'number': number,
      'active': active,
      'imageUrl': imageUrl,
    };
  }

  factory ServiceTakerModel.fromMap(Map<String, dynamic> map) {
    return ServiceTakerModel(
      id: map['id'] != null ? map['id'] as int : null,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      profileType: (map['profileType'] ?? 0) as int,
      companyName: (map['companyName'] ?? '') as String,
      fantasyName: (map['fantasyName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      cnpj: (map['cnpj'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      zip: (map['zip'] ?? '') as String,
      number: (map['number'] ?? '') as String,
      active: (map['active'] ?? false) as bool,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      employeer: map['employeer'] != null
          ? EmployeerModel.fromMap(map['employeer'] as Map<String, dynamic>)
          : null,
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
    String? companyName,
    String? fantasyName,
    String? email,
    String? cnpj,
    String? name,
    String? phone,
    String? zip,
    String? number,
    bool? active,
    String? imageUrl,
    EmployeerModel? employeer,
  }) {
    return ServiceTakerModel(
      id: id ?? this.id,
      user: user ?? this.user,
      password: password ?? this.password,
      profileType: profileType ?? this.profileType,
      companyName: companyName ?? this.companyName,
      fantasyName: fantasyName ?? this.fantasyName,
      email: email ?? this.email,
      cnpj: cnpj ?? this.cnpj,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      zip: zip ?? this.zip,
      number: number ?? this.number,
      active: active ?? this.active,
      imageUrl: imageUrl ?? this.imageUrl,
      employeer: employeer ?? this.employeer,
    );
  }
}
