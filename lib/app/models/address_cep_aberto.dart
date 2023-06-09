// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressCepAberto {
  final double altitude;
  final String cep;
  final String latitude;
  final String longitude;
  final String logradouro;
  final String bairro;
  final String complemento;
  final Cidade cidade;
  final Estado estado;
  AddressCepAberto({
    required this.altitude,
    required this.cep,
    required this.latitude,
    required this.longitude,
    required this.logradouro,
    required this.bairro,
    required this.complemento,
    required this.cidade,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'altitude': altitude,
      'cep': cep,
      'latitude': latitude,
      'longitude': longitude,
      'logradouro': logradouro,
      'bairro': bairro,
      'complemento': complemento,
      'cidade': cidade.toMap(),
      'estado': estado.toMap(),
    };
  }

  factory AddressCepAberto.fromMap(Map<String, dynamic> map) {
    return AddressCepAberto(
      altitude: (map['altitude'] ?? 0.0) as double,
      cep: (map['cep'] ?? '') as String,
      latitude: (map['latitude'] ?? '') as String,
      longitude: (map['longitude'] ?? '') as String,
      logradouro: (map['logradouro'] ?? '') as String,
      bairro: (map['bairro'] ?? '') as String,
      complemento: (map['complemento'] ?? '') as String,
      cidade: Cidade.fromMap(map['cidade'] as Map<String, dynamic>),
      estado: Estado.fromMap(map['estado'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressCepAberto.fromJson(String source) =>
      AddressCepAberto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Cidade {
  final int ddd;
  final String ibge;
  final String nome;
  Cidade({
    required this.ddd,
    required this.ibge,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'ibge': ibge,
      'nome': nome,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      ddd: (map['ddd'] ?? 0) as int,
      ibge: (map['ibge'] ?? '') as String,
      nome: (map['nome'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) =>
      Cidade.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Estado {
  final String sigla;
  Estado({
    required this.sigla,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sigla': sigla,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      sigla: (map['sigla'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) =>
      Estado.fromMap(json.decode(source) as Map<String, dynamic>);
}
