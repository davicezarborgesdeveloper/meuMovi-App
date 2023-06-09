import 'package:brasil_fields/brasil_fields.dart';

extension FormatterExtensions on double {
  String get currencyPTBR {
    return UtilBrasilFields.obterReal(this);
  }
}

// extension DateTimeExtension on DateTime {
//   String formattedDate() {
//     return DateFormat('dd/MM/yyyy HH:mm', 'pt-BR').format(this);
//   }
// }