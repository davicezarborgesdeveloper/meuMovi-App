import 'dart:convert';

class Address {
  final String zip;
  final String city;
  final String state;
  final String street;
  final String district;
  final String number;
  final String complement;
  final String? referencePoint;
  Address({
    required this.zip,
    required this.city,
    required this.state,
    required this.street,
    required this.district,
    required this.number,
    required this.complement,
    this.referencePoint,
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
