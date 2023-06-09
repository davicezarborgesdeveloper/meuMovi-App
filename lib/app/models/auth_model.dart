import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthModel {
  final String displayName;
  final String email;
  final String uid;
  AuthModel({
    required this.displayName,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'uid': uid,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      displayName: (map['displayName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
