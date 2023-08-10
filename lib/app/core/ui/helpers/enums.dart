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

enum CompanySector {
  administracao('Administração', 'ADM'),
  cadastro('Cadastro', 'CAD'),
  diretoria('Diretoria', 'DIR'),
  financeiro('Financeiro', 'FIN');

  final String name;
  final String acronym;

  const CompanySector(this.name, this.acronym);

  static CompanySector parse(String acronym) {
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

enum ProductionType {
  externa('Externa', 'E'),
  normal('Normal', 'N');

  final String name;
  final String acronym;
  const ProductionType(this.name, this.acronym);

  static ProductionType parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}

enum ReportType {
  tonelada('Tonelada', 'T'),
  saca('Saca', 'S'),
  dia('Diária', 'D'),
  hora('Hora', 'H'),
  unidade('Unidade', 'U');

  final String name;
  final String acronym;
  const ReportType(this.name, this.acronym);

  static ReportType parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}

enum OptionDistance {
  km25('25km', '25'),
  km50('50km', '50'),
  km75('75km', '75'),
  km100('100km', '100');

  final String name;
  final String acronym;
  const OptionDistance(this.name, this.acronym);

  static OptionDistance parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}
