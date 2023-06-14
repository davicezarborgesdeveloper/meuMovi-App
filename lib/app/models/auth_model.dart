import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthModel {
  final String displayName;
  final String userId;
  final String accessToken;
  AuthModel({
    required this.displayName,
    required this.userId,
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'userId': userId,
      'accessToken': accessToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      displayName: (map['DISPLAYNAME'] ?? '') as String,
      userId: (map['USER'] ?? '') as String,
      accessToken: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AuthModel copyWith({
    String? displayName,
    String? userId,
    String? accessToken,
  }) {
    return AuthModel(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
