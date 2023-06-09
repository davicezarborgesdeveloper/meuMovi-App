enum MaritalStatus {
  divorciado('Divorciado', 'DV'),
  separadoJudicial('Separado Judicialmente', 'SJ'),
  viuvo('Viúvo', 'VV'),
  casado('Casado', 'CS'),
  solteiro('Solteiro', 'ST');

  final String name;
  final String acronym;

  const MaritalStatus(this.name, this.acronym);

  static MaritalStatus parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}

enum BankReceiptType {
  pix('pix', 'px'),
  bank('bank', 'cc');

  final String name;
  final String acronym;

  const BankReceiptType(this.name, this.acronym);

  static BankReceiptType parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}

enum PixKeyType {
  cpf('CPF', 'CPF'),
  cnpj('CNPJ', 'CNPJ'),
  phone('Telefone', 'PHN'),
  email('E-mail', 'EMl');

  final String name;
  final String acronym;
  const PixKeyType(this.name, this.acronym);

  static PixKeyType parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}

enum AccountType {
  corrente('Conta Corrente', 'CC'),
  poupanca('Conta Poupança', 'CP');

  final String name;
  final String acronym;
  const AccountType(this.name, this.acronym);

  static AccountType parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}
