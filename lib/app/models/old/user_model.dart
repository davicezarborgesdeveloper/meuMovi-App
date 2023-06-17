// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/ui/helpers/enums.dart';

// class UserModel {
//   String? id;
//   final String name;
//   final String lastname;
//   final String? surname;
//   final String birthdate;
//   final String? motherName;
//   final MaritalStatus? maritalStatus;
//   final String? phone;
//   final String email;
//   final String cpf;
//   final String rg;
//   final String? orgaoEmissor;
//   final String? dataEmissao;
//   final Address address;
//   final BankReceipt? bankReceipt;
//   final bool active;
//   UserModel({
//     this.id,
//     required this.name,
//     required this.lastname,
//     this.surname,
//     required this.birthdate,
//     this.motherName,
//     this.maritalStatus,
//     this.phone,
//     required this.email,
//     required this.cpf,
//     required this.rg,
//     this.orgaoEmissor,
//     this.dataEmissao,
//     required this.address,
//     this.bankReceipt,
//     required this.active,
//   });

//   String get fullName => '$name $lastname';

//   UserModel copyWith({
//     String? id,
//     String? name,
//     String? lastname,
//     String? surname,
//     String? birthdate,
//     String? motherName,
//     MaritalStatus? maritalStatus,
//     String? phone,
//     String? email,
//     String? cpf,
//     String? rg,
//     String? orgaoEmissor,
//     String? dataEmissao,
//     Address? address,
//     BankReceipt? bankReceipt,
//     bool? active,
//   }) {
//     return UserModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       lastname: lastname ?? this.lastname,
//       surname: surname ?? this.surname,
//       birthdate: birthdate ?? this.birthdate,
//       motherName: motherName ?? this.motherName,
//       maritalStatus: maritalStatus ?? this.maritalStatus,
//       phone: phone ?? this.phone,
//       email: email ?? this.email,
//       cpf: cpf ?? this.cpf,
//       rg: rg ?? this.rg,
//       orgaoEmissor: orgaoEmissor ?? this.orgaoEmissor,
//       dataEmissao: dataEmissao ?? this.dataEmissao,
//       address: address ?? this.address,
//       bankReceipt: bankReceipt ?? this.bankReceipt,
//       active: active ?? this.active,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'lastname': lastname,
//       'surname': surname,
//       'birthdate': birthdate,
//       'motherName': motherName,
//       'maritalStatus': maritalStatus?.acronym,
//       'phone': phone,
//       'email': email,
//       'cpf': cpf,
//       'rg': rg,
//       'orgaoEmissor': orgaoEmissor,
//       'dataEmissao': dataEmissao,
//       'address': address.toMap(),
//       'bankReceipt': bankReceipt?.toMap(),
//       'active': active,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       id: map['id'] != null ? map['id'] as String : null,
//       name: (map['name'] ?? '') as String,
//       lastname: (map['lastname'] ?? '') as String,
//       surname: map['surname'] != null ? map['surname'] as String : null,
//       birthdate: (map['birthdate'] ?? '') as String,
//       motherName:
//           map['motherName'] != null ? map['motherName'] as String : null,
//       maritalStatus: map['maritalStatus'] != null
//           ? MaritalStatus.parse(map['maritalStatus'])
//           : null,
//       phone: map['phone'] != null ? map['phone'] as String : null,
//       email: (map['email'] ?? '') as String,
//       cpf: (map['cpf'] ?? '') as String,
//       rg: (map['rg'] ?? '') as String,
//       orgaoEmissor:
//           map['orgaoEmissor'] != null ? map['orgaoEmissor'] as String : null,
//       dataEmissao:
//           map['dataEmissao'] != null ? map['dataEmissao'] as String : null,
//       address: Address.fromMap(map['address'] as Map<String, dynamic>),
//       bankReceipt: map['bankReceipt'] != null
//           ? BankReceipt.fromMap(map['bankReceipt'] as Map<String, dynamic>)
//           : null,
//       active: (map['active'] ?? false) as bool,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromJson(String source) =>
//       UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class BankReceipt {
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
  BankReceipt({
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

  String get accountWithDigit => '$account-$verifyingDigit';

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

  factory BankReceipt.fromMap(Map<String, dynamic> map) {
    return BankReceipt(
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

  factory BankReceipt.fromJson(String source) =>
      BankReceipt.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class BankReceipt {
//   final Pix? pix;
//   final BankAccount? bankAccount;
//   BankReceipt({
//     this.pix,
//     this.bankAccount,
//   });

//   BankReceipt copyWith({
//     Pix? pix,
//     BankAccount? bankAccount,
//   }) {
//     return BankReceipt(
//       pix: pix ?? this.pix,
//       bankAccount: bankAccount ?? this.bankAccount,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'pix': pix?.toMap(),
//       'bankAccount': bankAccount?.toMap(),
//     };
//   }

//   factory BankReceipt.fromMap(Map<String, dynamic> map) {
//     return BankReceipt(
//       pix: map['pix'] != null
//           ? Pix.fromMap(map['pix'] as Map<String, dynamic>)
//           : null,
//       bankAccount: map['bankAccount'] != null
//           ? BankAccount.fromMap(map['bankAccount'] as Map<String, dynamic>)
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BankReceipt.fromJson(String source) =>
//       BankReceipt.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class Pix {
  final PixKeyType? pixKeyType;
  final String? pixKey;
  Pix({
    this.pixKeyType,
    this.pixKey,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pixKeyType': pixKeyType?.acronym,
      'pixKey': pixKey,
    };
  }

  factory Pix.fromMap(Map<String, dynamic> map) {
    return Pix(
      pixKeyType: map['pixKeyType'] != null
          ? PixKeyType.parse(map['pixKeyType'])
          : null,
      pixKey: (map['pixKey'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pix.fromJson(String source) =>
      Pix.fromMap(json.decode(source) as Map<String, dynamic>);

  Pix copyWith({
    PixKeyType? pixKeyType,
    String? pixKey,
  }) {
    return Pix(
      pixKeyType: pixKeyType ?? this.pixKeyType,
      pixKey: pixKey ?? this.pixKey,
    );
  }
}

class BankAccount {
  final String? cardholderName;
  final String? holdersCPF;
  final String? bankName;
  final String? agency;
  final String? account;
  final String? verifyingDigit;
  final AccountType? accountType;
  BankAccount({
    this.cardholderName,
    this.holdersCPF,
    this.bankName,
    this.agency,
    this.account,
    this.verifyingDigit,
    this.accountType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardholderName': cardholderName,
      'holdersCPF': holdersCPF,
      'bankName': bankName,
      'agency': agency,
      'account': account,
      'verifyingDigit': verifyingDigit,
      'accountType': accountType?.acronym,
    };
  }

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccount.fromJson(String source) =>
      BankAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Address {
  final String zip;
  final String city;
  final String state;
  final String street;
  final String district;
  final String number;
  final String complement;
  final String referencePoint;
  Address({
    required this.zip,
    required this.city,
    required this.state,
    required this.street,
    required this.district,
    required this.number,
    required this.complement,
    required this.referencePoint,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zip': zip,
      'city': city,
      'state': state,
      'street': street,
      'district': district,
      'number': number,
      'complement': complement,
      'referencePoint': referencePoint,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      zip: (map['zip'] ?? '') as String,
      city: (map['city'] ?? '') as String,
      state: (map['state'] ?? '') as String,
      street: (map['street'] ?? '') as String,
      district: (map['district'] ?? '') as String,
      number: (map['number'] ?? '') as String,
      complement: (map['complement'] ?? '') as String,
      referencePoint: (map['referencePoint'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  Address copyWith({
    String? zip,
    String? city,
    String? state,
    String? street,
    String? district,
    String? number,
    String? complement,
    String? referencePoint,
  }) {
    return Address(
      zip: zip ?? this.zip,
      city: city ?? this.city,
      state: state ?? this.state,
      street: street ?? this.street,
      district: district ?? this.district,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      referencePoint: referencePoint ?? this.referencePoint,
    );
  }
}
