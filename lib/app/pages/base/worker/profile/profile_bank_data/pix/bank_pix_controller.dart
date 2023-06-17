// import 'package:mobx/mobx.dart';

// import '../../../../../core/extensions/validator_extensions.dart';
// import '../../../../../core/ui/helpers/enums.dart';
// part 'bank_pix_controller.g.dart';

// enum BankPixStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   saved,
// }

// class BankPixController = BankPixControllerBase with _$BankPixController;

// abstract class BankPixControllerBase with Store {
//   @readonly
//   var _status = BankPixStateStatus.initial;

//   @readonly
//   String? _errorMessage;

//   @readonly
//   bool _showErrors = false;

//   @observable
//   PixKeyType? pixKeyType;

//   @observable
//   String? pixKey;

//   @action
//   void setPixKeyType(PixKeyType? value) => pixKeyType = value;

//   @action
//   void setPixKey(String value) => pixKey = value;

//   @computed
//   bool get pixKeyTypeValid => pixKeyType != null;
//   String? get pixKeyTypeError {
//     if (!_showErrors || pixKeyTypeValid) {
//       return null;
//     } else {
//       return 'Campo Obrigatório';
//     }
//   }

//   @computed
//   bool get pixKeyValid => pixKey != null && pixKeyValidation;
//   String? get pixKeyError {
//     if (!_showErrors || pixKeyValid) {
//       return null;
//     } else {
//       return 'Campo Obrigatório';
//     }
//   }

//   bool get pixKeyValidation {
//     if (pixKey != null) {
//       if (pixKeyType!.acronym == 'CPF') {
//         return pixKey!.isCPFValid;
//       } else if (pixKeyType!.acronym == 'CNPJ') {
//         return pixKey!.isCNPJValid;
//       } else if (pixKeyType!.acronym == 'PHN') {
//         return pixKey!.isPhoneValid;
//       } else if (pixKeyType!.acronym == 'EMl') {
//         return pixKey!.isEmailValid;
//       }
//     }
//     return false;
//   }

//   @computed
//   bool get isFormValid => pixKeyTypeValid && pixKeyValid;

//   @action
//   void invalidSendPressed() => _showErrors = true;

//   @computed
//   dynamic get sendPressed => isFormValid ? save : null;

//   @action
//   Future<void> save() async {
//     // try {
//     //   _status = BankPixStateStatus.loading;
//     //   final UserModel? usrMod = GetIt.I<UserController>().user;
//     //   final userSave = usrMod!.copyWith(
//     //     bankReceipt: BankReceipt(
//     //       pixKey: pixKey,
//     //       pixKeyType: pixKeyType,
//     //       bankReceiptType: BankReceiptType.pix,
//     //     ),
//     //   );
//     //   await UserService().update(userSave);
//     //   GetIt.I<UserController>().setUser(userSave);
//     //   _status = BankPixStateStatus.saved;
//     // } on Exception catch (e, s) {
//     //   log('Erro ao atualizar usuário', error: e, stackTrace: s);
//     //   _errorMessage = 'Erro ao atualizar usuário';
//     //   _status = BankPixStateStatus.error;
//     // }
//   }
// }
