import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthModel {
  final String displayName;
  final String userId;
  final int profileType;
  AuthModel({
    required this.displayName,
    required this.userId,
    required this.profileType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'userId': userId,
      'profileType': profileType,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      displayName: (map['displayName'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      profileType: (map['profileType'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AuthModel copyWith({
    String? displayName,
    String? userId,
    int? profileType,
  }) {
    return AuthModel(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      profileType: profileType ?? this.profileType,
    );
  }
}
