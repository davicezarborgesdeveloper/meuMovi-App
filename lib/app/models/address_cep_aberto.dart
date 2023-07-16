import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddressCepAberto {
  final String? cep;
  final String? logradouro;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final int? ddd;
  final String? ibge;
  AddressCepAberto({
    this.cep,
    this.logradouro,
    this.bairro,
    this.cidade,
    this.estado,
    this.ddd,
    this.ibge,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'ddd': ddd,
      'ibge': ibge,
    };
  }

  factory AddressCepAberto.fromMap(Map<String, dynamic> map) {
    return AddressCepAberto(
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      ddd: map['ddd'] != null ? map['ddd'] as int : null,
      ibge: map['ibge'] != null ? map['ibge'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressCepAberto.fromJson(String source) =>
      AddressCepAberto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressCepAberto(cep: $cep, logradouro: $logradouro, bairro: $bairro, cidade: $cidade, estado: $estado, ddd: $ddd, ibge: $ibge)';
  }
}
