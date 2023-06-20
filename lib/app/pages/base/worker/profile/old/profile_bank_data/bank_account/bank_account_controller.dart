// import 'dart:developer';

// import 'package:mobx/mobx.dart';

// import '../../../../../core/extensions/validator_extensions.dart';
// import '../../../../../core/ui/helpers/enums.dart';
// import '../../../../../models/bank_model.dart';
// import '../../../../../repositories/banks/banks_repository.dart';
// part 'bank_account_controller.g.dart';

// enum BankAccountStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   saved,
// }

// class BankAccountController = BankAccountControllerBase
//     with _$BankAccountController;

// abstract class BankAccountControllerBase with Store {
  // @readonly
  // var _status = BankAccountStateStatus.initial;

  // @readonly
  // var _bankList = <BankModel>[];

  // @readonly
  // String? _errorMessage;

  // @readonly
  // bool _showErrors = false;

  // @observable
  // String? cardholderName;

  // @observable
  // String? holdersCPF;

  // @observable
  // BankModel? bank;

  // @observable
  // String? agency;

  // @observable
  // String? account;

  // @observable
  // String? verifyingDigit;

  // @observable
  // AccountType? accountType;

  // @action
  // void setCardholderName(String value) => cardholderName = value;

  // @action
  // void setHoldersCPF(String value) => holdersCPF = value;

  // @action
  // void setBank(BankModel? value) => bank = value;

  // @action
  // void setAgency(String value) => agency = value;

  // @action
  // void setAccount(String value) => account = value;

  // @action
  // void setVerifyingDigit(String value) => verifyingDigit = value;

  // @action
  // void setAccountType(AccountType? value) => accountType = value;

  // @computed
  // bool get cardholderNameValid =>
  //     cardholderName != null && cardholderName!.length > 3;
  // String? get cardholderNameError {
  //   if (!_showErrors || cardholderNameValid) {
  //     return null;
  //   } else if (cardholderName == null || cardholderName!.isEmpty) {
  //     return 'Nome do titular Obrigatório';
  //   } else {
  //     return 'Nome do titular muito curto';
  //   }
  // }

  // @computed
  // bool get holdersCPFValid => holdersCPF != null && holdersCPF!.isCPFValid;
  // String? get holdersCPFError {
  //   if (!_showErrors || holdersCPFValid) {
  //     return null;
  //   } else if (holdersCPF == null || holdersCPF!.isEmpty) {
  //     return 'CPF do titular Obrigatório';
  //   } else if (!holdersCPF!.isCPFValid) {
  //     return 'CPF do titular inválido';
  //   } else {
  //     return 'CPF do titular muito curto';
  //   }
  // }

  // @computed
  // bool get bankValid => bank != null;
  // String? get bankError {
  //   if (!_showErrors || bankValid) {
  //     return null;
  //   } else {
  //     return 'Banco Obrigatório';
  //   }
  // }

  // @computed
  // bool get agencyValid => agency != null && agency!.length >= 4;
  // String? get agencyError {
  //   if (!_showErrors || agencyValid) {
  //     return null;
  //   } else if (agency == null || agency!.isEmpty) {
  //     return 'Agência Obrigatória';
  //   } else {
  //     return 'Agência muito curta';
  //   }
  // }

  // @computed
  // bool get accountValid => account != null && account!.length >= 4;
  // String? get accountError {
  //   if (!_showErrors || agencyValid) {
  //     return null;
  //   } else if (account == null || account!.isEmpty) {
  //     return 'Conta Obrigatória';
  //   } else {
  //     return 'Conta muito curta';
  //   }
  // }

  // @computed
  // bool get verifyingDigitValid =>
  //     verifyingDigit != null && verifyingDigit!.length == 1;
  // String? get verifyingDigitError {
  //   if (!_showErrors || agencyValid) {
  //     return null;
  //   } else if (verifyingDigit == null || verifyingDigit!.isEmpty) {
  //     return 'Dígito Obrigatório';
  //   } else {
  //     return 'Dígito muito curto';
  //   }
  // }

  // @computed
  // bool get accountTypeValid => accountType != null;
  // String? get accountTypeError {
  //   if (!_showErrors || accountTypeValid) {
  //     return null;
  //   } else {
  //     return 'Campo Obrigatório';
  //   }
  // }

  // @computed
  // bool get isFormValid =>
  //     cardholderNameValid &&
  //     holdersCPFValid &&
  //     bankValid &&
  //     agencyValid &&
  //     accountValid &&
  //     verifyingDigitValid &&
  //     accountTypeValid;

  // @action
  // void invalidSendPressed() => _showErrors = true;

  // @computed
  // dynamic get sendPressed => isFormValid ? save : null;

  // @action
  // Future<void> save() async {
  //   // try {
  //   //   _status = BankAccountStateStatus.loading;
  //   //   final UserModel? usrMod = GetIt.I<UserController>().user;
  //   //   final userSave = usrMod!.copyWith(
  //   //     bankReceipt: BankReceipt(
  //   //       cardholderName: cardholderName,
  //   //       holdersCPF: holdersCPF,
  //   //       bankName: bank!.fullname,
  //   //       agency: agency,
  //   //       account: account,
  //   //       verifyingDigit: verifyingDigit,
  //   //       accountType: accountType,
  //   //       bankReceiptType: BankReceiptType.bank,
  //   //     ),
  //   //   );
  //   //   await UserService().update(userSave);
  //   //   GetIt.I<UserController>().setUser(userSave);
  //   //   _status = BankAccountStateStatus.saved;
  //   // } on Exception catch (e, s) {
  //   //   log('Erro ao atualizar usuário', error: e, stackTrace: s);
  //   //   _errorMessage = 'Erro ao atualizar usuário';
  //   //   _status = BankAccountStateStatus.error;
  //   // }
  // }

  // @action
  // Future<void> findBanks() async {
  //   try {
  //     _status = BankAccountStateStatus.loading;
  //     _bankList = await BanksRepository().getBankList();
  //     _status = BankAccountStateStatus.loaded;
  //   } catch (e, s) {
  //     log('Erro ao buscar bancos', error: e, stackTrace: s);
  //     _status = BankAccountStateStatus.error;
  //     _errorMessage = 'Erro ao buscar bancos';
  //   }
  // }
// }
