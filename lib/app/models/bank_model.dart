import 'dart:convert';

class BankModel {
  final String ispb;
  final String name;
  final int code;
  final String fullname;
  BankModel({
    required this.ispb,
    required this.name,
    required this.code,
    required this.fullname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ispb': ispb,
      'name': name,
      'code': code,
      'fullName': fullname,
    };
  }

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      ispb: (map['ispb'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      code: (map['code'] ?? 0) as int,
      fullname: (map['fullName'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankModel.fromJson(String source) =>
      BankModel.fromMap(json.decode(source) as Map<String, dynamic>);

  BankModel copyWith({
    String? ispb,
    String? name,
    int? code,
    String? fullname,
  }) {
    return BankModel(
      ispb: ispb ?? this.ispb,
      name: name ?? this.name,
      code: code ?? this.code,
      fullname: fullname ?? this.fullname,
    );
  }
}
