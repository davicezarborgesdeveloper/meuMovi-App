// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'address_model.dart';
import 'user_model.dart';

class SyndicateModel implements UserModel {
  final int? id;
  final String user;
  final String password;
  final int profileType;
  final bool active;
  final CompanyDataModel companyData;
  final ResponsibleContact responsibleContact;
  final AddressModel address;
  final String? imageUrl;
  SyndicateModel({
    this.id,
    required this.user,
    required this.password,
    required this.profileType,
    required this.active,
    required this.companyData,
    required this.responsibleContact,
    required this.address,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'password': password,
      'profileType': profileType,
      'active': active,
      'companyData': companyData.toMap(),
      'responsibleContact': responsibleContact.toMap(),
      'address': address.toMap(),
      'imageUrl': imageUrl,
    };
  }

  factory SyndicateModel.fromMap(Map<String, dynamic> map) {
    return SyndicateModel(
      id: map['id'] != null ? map['id'] as int : null,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      profileType: (map['profileType'] ?? 0) as int,
      active: map['active'] != null
          ? map['active'] == 1
              ? true
              : false
          : false,
      companyData:
          CompanyDataModel.fromMap(map['syndicate'] as Map<String, dynamic>),
      responsibleContact: ResponsibleContact.fromMap(
        map['responsibleContact'] as Map<String, dynamic>,
      ),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory SyndicateModel.fromJson(String source) =>
      SyndicateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SyndicateModel copyWith({
    int? id,
    String? user,
    String? password,
    int? profileType,
    bool? active,
    CompanyDataModel? companyData,
    ResponsibleContact? responsibleContact,
    AddressModel? address,
    String? imageUrl,
  }) {
    return SyndicateModel(
      id: id ?? this.id,
      user: user ?? this.user,
      password: password ?? this.password,
      profileType: profileType ?? this.profileType,
      active: active ?? this.active,
      companyData: companyData ?? this.companyData,
      responsibleContact: responsibleContact ?? this.responsibleContact,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'SyndicateModel(id: $id, user: $user, password: $password, profileType: $profileType, active: $active, companyData: $companyData, responsibleContact: $responsibleContact, address: $address, imageUrl: $imageUrl)';
  }
}

class CompanyDataModel {
  final String corporateName;
  final String fantasyName;
  final String cnpj;
  CompanyDataModel({
    required this.corporateName,
    required this.fantasyName,
    required this.cnpj,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'corporateName': corporateName,
      'fantasyName': fantasyName,
      'cnpj': cnpj,
    };
  }

  factory CompanyDataModel.fromMap(Map<String, dynamic> map) {
    return CompanyDataModel(
      corporateName: (map['corporateName'] ?? '') as String,
      fantasyName: (map['fantasyName'] ?? '') as String,
      cnpj: (map['cnpj'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyDataModel.fromJson(String source) =>
      CompanyDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CompanyDataModel copyWith({
    String? corporateName,
    String? fantasyName,
    String? cnpj,
  }) {
    return CompanyDataModel(
      corporateName: corporateName ?? this.corporateName,
      fantasyName: fantasyName ?? this.fantasyName,
      cnpj: cnpj ?? this.cnpj,
    );
  }

  @override
  String toString() =>
      'CompanyDataModel(corporateName: $corporateName, fantasyName: $fantasyName, cnpj: $cnpj)';
}

class ResponsibleContact {
  final String name;
  final String email;
  final String phone;
  final String mobile;
  final String sector;
  ResponsibleContact({
    required this.name,
    required this.email,
    required this.phone,
    required this.mobile,
    required this.sector,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'mobile': mobile,
      'sector': sector,
    };
  }

  factory ResponsibleContact.fromMap(Map<String, dynamic> map) {
    return ResponsibleContact(
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      mobile: (map['mobile'] ?? '') as String,
      sector: (map['sector'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponsibleContact.fromJson(String source) =>
      ResponsibleContact.fromMap(json.decode(source) as Map<String, dynamic>);

  ResponsibleContact copyWith({
    String? name,
    String? email,
    String? phone,
    String? mobile,
    String? sector,
  }) {
    return ResponsibleContact(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      mobile: mobile ?? this.mobile,
      sector: sector ?? this.sector,
    );
  }
}
