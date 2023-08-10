import 'package:brasil_fields/brasil_fields.dart';

extension FormatterDouble on double {
  String get currencyPTBR {
    return UtilBrasilFields.obterReal(this);
  }
}

extension FormatterString on String {
  String get formattedCNPJ {
    return UtilBrasilFields.obterCnpj(this);
  }

  String get formattedCPF {
    return UtilBrasilFields.obterCpf(this);
  }

  String get formattedPhone {
    if (length == 10 || length == 11) {
      return UtilBrasilFields.obterTelefone(this);
    } else {
      return this;
    }
  }

  String get formattedZip {
    return UtilBrasilFields.obterCep(this);
  }
}
