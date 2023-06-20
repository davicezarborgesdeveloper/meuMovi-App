// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:intl/intl.dart';

import '../core/ui/helpers/enums.dart';
import 'address_model.dart';
import 'user_model.dart';

class WorkerModel implements UserModel {
  int? id;
  String? user;
  final String password;
  final int? profileType;
  final bool active;
  final String name;
  final String lastname;
  final DocumentsModel documents;
  final PersonalModel personal;
  final AddressModel address;
  final BankDataModel? bankData;
  final String? imageUrl;
  WorkerModel({
    this.id,
    this.user,
    required this.password,
    this.profileType,
    required this.active,
    required this.name,
    required this.lastname,
    required this.documents,
    required this.personal,
    required this.address,
    this.bankData,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'password': password,
      'profileType': profileType,
      'active': active,
      'name': name,
      'lastname': lastname,
      'documents': documents.toMap(),
      'personal': personal.toMap(),
      'address': address.toMap(),
      'bankData': bankData?.toMap(),
      'imageUrl': imageUrl,
    };
  }

  factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      id: map['id'] != null ? map['id'] as int : null,
      user: map['user'] != null ? map['user'] as String : null,
      password: (map['password'] ?? '') as String,
      profileType:
          map['profileType'] != null ? map['profileType'] as int : null,
      active: map['active'] != null
          ? map['active'] == 1
              ? true
              : false
          : false,
      name: (map['name'] ?? '') as String,
      lastname: (map['lastname'] ?? '') as String,
      documents:
          DocumentsModel.fromMap(map['documents'] as Map<String, dynamic>),
      personal: PersonalModel.fromMap(map['personal'] as Map<String, dynamic>),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      bankData: map['bankData'] != null
          ? BankDataModel.fromMap(map['bankData'] as Map<String, dynamic>)
          : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  factory WorkerModel.fromJson(String source) =>
      WorkerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  WorkerModel copyWith({
    int? id,
    String? user,
    String? password,
    int? profileType,
    bool? active,
    String? name,
    String? lastname,
    DocumentsModel? documents,
    PersonalModel? personal,
    AddressModel? address,
    BankDataModel? bankData,
    String? imageUrl,
  }) {
    return WorkerModel(
      id: id ?? this.id,
      user: user ?? this.user,
      password: password ?? this.password,
      profileType: profileType ?? this.profileType,
      active: active ?? this.active,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      documents: documents ?? this.documents,
      personal: personal ?? this.personal,
      address: address ?? this.address,
      bankData: bankData ?? this.bankData,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toJson() {
    return json.encode(toMap());
  }

  String get fullname => '$name $lastname';
}

class DocumentsModel {
  final String cpf;
  final String rg;
  final String? orgaoEmissor;
  final String? dataEmissao;
  DocumentsModel({
    required this.cpf,
    required this.rg,
    this.orgaoEmissor,
    this.dataEmissao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'rg': rg,
      'orgaoEmissor': orgaoEmissor,
      'dataEmissao': dataEmissao,
    };
  }

  factory DocumentsModel.fromMap(Map<String, dynamic> map) {
    return DocumentsModel(
      cpf: (map['cpf'] ?? '') as String,
      rg: (map['rg'] ?? '') as String,
      orgaoEmissor:
          map['orgaoEmissor'] != null ? map['orgaoEmissor'] as String : null,
      dataEmissao:
          map['dataEmissao'] != null ? map['dataEmissao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentsModel.fromJson(String source) =>
      DocumentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  DocumentsModel copyWith({
    String? cpf,
    String? rg,
    String? orgaoEmissor,
    String? dataEmissao,
  }) {
    return DocumentsModel(
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      orgaoEmissor: orgaoEmissor ?? this.orgaoEmissor,
      dataEmissao: dataEmissao ?? this.dataEmissao,
    );
  }
}

class PersonalModel {
  final String birthdate;
  final String? motherName;
  final MaritalStatus? maritalStatus;
  final String? phone;
  final String email;
  final String? surname;
  PersonalModel({
    required this.birthdate,
    this.motherName,
    this.maritalStatus,
    this.phone,
    required this.email,
    this.surname,
  });

  Map<String, dynamic> toMap() {
    final dt = DateFormat('dd/MM/yyyy').parse(birthdate);
    return <String, dynamic>{
      'birthdate': DateFormat('yyyy-MM-dd').format(dt),
      'motherName': motherName,
      'maritalStatus': maritalStatus?.acronym,
      'phone': phone,
      'email': email,
      'surname': surname,
    };
  }

  static String formatDate(String strData) {
    final DateTime dt = DateFormat('yyyy-MM-dd').parse(strData);
    return DateFormat('dd/MM/yyyy').format(dt);
  }

  factory PersonalModel.fromMap(Map<String, dynamic> map) {
    return PersonalModel(
      birthdate: formatDate((map['birthdate'] ?? '') as String),
      motherName:
          map['motherName'] != null ? map['motherName'] as String : null,
      maritalStatus: map['maritalStatus'] != null
          ? MaritalStatus.parse(map['maritalStatus'])
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: (map['email'] ?? '') as String,
      surname: map['surname'] != null ? map['surname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalModel.fromJson(String source) =>
      PersonalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PersonalModel copyWith({
    String? birthdate,
    String? motherName,
    MaritalStatus? maritalStatus,
    String? phone,
    String? email,
    String? surname,
  }) {
    return PersonalModel(
      birthdate: birthdate ?? this.birthdate,
      motherName: motherName ?? this.motherName,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      surname: surname ?? this.surname,
    );
  }
}

class BankDataModel {
  final PixKeyType? pixKeyType;
  final String? pixKey;
  final String? cardholderName;
  final String? holdersCPF;
  final String? bankName;
  final String? agency;
  final String? account;
  final String? verifyingDigit;
  final AccountType? accountType;
  final BankReceiptType bankReceiptType;
  BankDataModel({
    this.pixKeyType,
    this.pixKey,
    this.cardholderName,
    this.holdersCPF,
    this.bankName,
    this.agency,
    this.account,
    this.verifyingDigit,
    this.accountType,
    required this.bankReceiptType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pixKeyType': pixKeyType?.acronym,
      'pixKey': pixKey,
      'cardholderName': cardholderName,
      'holdersCPF': holdersCPF,
      'bankName': bankName,
      'agency': agency,
      'account': account,
      'verifyingDigit': verifyingDigit,
      'accountType': accountType?.acronym,
      'bankReceiptType': bankReceiptType.acronym,
    };
  }

  factory BankDataModel.fromMap(Map<String, dynamic> map) {
    return BankDataModel(
      pixKeyType: map['pixKeyType'] != null
          ? PixKeyType.parse(map['pixKeyType'])
          : null,
      pixKey: map['pixKey'] != null ? map['pixKey'] as String : null,
      cardholderName: map['cardholderName'] != null
          ? map['cardholderName'] as String
          : null,
      holdersCPF:
          map['holdersCPF'] != null ? map['holdersCPF'] as String : null,
      bankName: map['bankName'] != null ? map['bankName'] as String : null,
      agency: map['agency'] != null ? map['agency'] as String : null,
      account: map['account'] != null ? map['account'] as String : null,
      verifyingDigit: map['verifyingDigit'] != null
          ? map['verifyingDigit'] as String
          : null,
      accountType: map['accountType'] != null
          ? AccountType.parse(map['accountType'])
          : null,
      bankReceiptType: BankReceiptType.parse(
        map['bankReceiptType'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BankDataModel.fromJson(String source) =>
      BankDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  BankDataModel copyWith({
    PixKeyType? pixKeyType,
    String? pixKey,
    String? cardholderName,
    String? holdersCPF,
    String? bankName,
    String? agency,
    String? account,
    String? verifyingDigit,
    AccountType? accountType,
    BankReceiptType? bankReceiptType,
  }) {
    return BankDataModel(
      pixKeyType: pixKeyType ?? this.pixKeyType,
      pixKey: pixKey ?? this.pixKey,
      cardholderName: cardholderName ?? this.cardholderName,
      holdersCPF: holdersCPF ?? this.holdersCPF,
      bankName: bankName ?? this.bankName,
      agency: agency ?? this.agency,
      account: account ?? this.account,
      verifyingDigit: verifyingDigit ?? this.verifyingDigit,
      accountType: accountType ?? this.accountType,
      bankReceiptType: bankReceiptType ?? this.bankReceiptType,
    );
  }
}
