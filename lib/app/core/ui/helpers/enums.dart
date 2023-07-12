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

// enum KindWork {
//   carga('Carga', 'crg'),
//   descarga('Descarga', 'dcg'),
//   movInterna('Mov. Interna', 'mvi'),
//   descargaMovimentacaoInterna('Descarga e Movimentação Interna', 'dmi'),
//   descargaArmazenamento('Descarga e Armazenamento', 'dga'),
//   chapaGuia('Chapa Guia', 'cpg'),
//   chapaGuiaDescarga('Chapa Guia e Descarga', 'cgd'),
//   chapaGuiaDescargaArmazenamento('Chapa Guia,Descarga e Armazenamento', 'cda'),
//   transbordo('Transbordo', 'tnb'),
//   chapaGuiaDescargaMovimentacaoInterna(
//       'Chapa Guia, Descarga e Movimentação Interna', 'cgm'),
//   movimentacaoInternaCarga('Movimentação Interna e Carga', 'mic'),
//   descargaConferente('Descarga e Conferente', 'dgc'),
//   conferente('Conferente', 'cfr'),
//   cargaDescarga('Carga e Descarga', 'cdg'),
//   cargaDescargaArmazenagem('Carga ou Descarga e Armazenagem', 'cdz'),
//   descargaPropria('Descarga Própria', 'dgp'),
//   descargaCliente('Descarga Cliente', 'dgc'),
//   descargaPesagemArmazenagem('Descarga, Pesagem e Armazenagem', 'dpa'),
//   descargaEscada('Descarga com Escada', 'dge'),
//   alimentacaoEstadiaDescarga('Alimentação e Estadia em Descarga', 'aed');

//   final String name;
//   final String acronym;
//   const KindWork(this.name, this.acronym);

//   static KindWork parse(String acronym) {
//     return values.firstWhere((s) => s.acronym == acronym);
//   }
// }

// enum VehicleType {
//   bftCarreta28000('Brf Carreta 28000Kg', 'bc28'),
//   bftTruck11000('Brf Truck 11000Kg', 'bt11'),
//   bftToco7000('Brf Toco 7000Kg', 'bt07'),
//   bftLeve3000('Brf Truck 3000Kg', 'bl03'),
//   bftExtraLeve1500('Brf Extra Leve 1500Kg', 'be15'),
//   bftMoto250('Brf Moto 250Kg', 'bm25'),
//   bftFiorino600('Brf Fiorino 600Kg', 'bf60'),
//   truck34('3/4', 'tc34'),
//   bitrem('Bitrem', 'btrm'),
//   carreta('Carreta', 'crrt'),
//   container('Container', 'ctnr'),
//   kombi('Kombi', 'kmbi'),
//   rodotrem('Rodotrem', 'rdtr'),
//   toco('Toco', 'toco'),
//   truck('Truck', 'trck'),
//   vanFurgao('Van Furgão', 'vnfg'),
//   fiorino('Fiorino', 'firn'),
//   hR('HR', 'tkhr'),
//   vuc('Vuc', 'tcvc'),
//   marfrigFiorino600('Marfrig Fiorino 600kg', 'mff6'),
//   marfrigVan1500('Marfrig Van 1500kg', 'mf15'),
//   marfrigVuc2500('Marfrig Vuc 2500kg', 'mf25'),
//   marfrig343500('Marfrig 3/4 3500kg', 'mf35'),
//   marfrigToco6000('Marfrig Toco 6000kg', 'mf60'),
//   marfrigTruck11200('Marfrig Truck 11200kg', 'mf11'),
//   marfrigBitruck600('Marfrig Bitruck 16500kg', 'mf16');

//   final String name;
//   final String acronym;
//   const VehicleType(this.name, this.acronym);

//   static VehicleType parse(String acronym) {
//     return values.firstWhere((s) => s.acronym == acronym);
//   }
// }

// enum LoadType {
//   seca('Seca', 'sc'),
//   refrigerada('Refrigerada', 'rf');

//   final String name;
//   final String acronym;
//   const LoadType(this.name, this.acronym);

//   static LoadType parse(String acronym) {
//     return values.firstWhere((s) => s.acronym == acronym);
//   }
// }

// enum LoadingType {
//   paletizado('Paletizado', 'pl'),
//   batido('Batido', 'bt'),
//   misto('Misto', 'mt');

//   final String name;
//   final String acronym;
//   const LoadingType(this.name, this.acronym);

//   static LoadingType parse(String acronym) {
//     return values.firstWhere((s) => s.acronym == acronym);
//   }
// }

// enum DockType {
//   pison('Piso', 'ps'),
//   plataforma('Plataforma', 'pt'),
//   trilateral('Trilateral', 'tl');

//   final String name;
//   final String acronym;
//   const DockType(this.name, this.acronym);

//   static DockType parse(String acronym) {
//     return values.firstWhere((s) => s.acronym == acronym);
//   }
// }
