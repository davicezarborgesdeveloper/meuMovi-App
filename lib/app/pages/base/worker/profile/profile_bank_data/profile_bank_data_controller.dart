// import 'package:mobx/mobx.dart';

// import '../../../../models/user_model.dart';

// part 'profile_bank_data_controller.g.dart';

// enum ProfileBankDataStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   update,
// }

// class ProfileBankDataController = ProfileBankDataControllerBase
//     with _$ProfileBankDataController;

// abstract class ProfileBankDataControllerBase with Store {
//   @readonly
//   var _status = ProfileBankDataStateStatus.initial;

//   @readonly
//   String? _errorMessage;

//   @observable
//   BankReceipt? bankReceipt;

//   @action
//   Future<void> findBankReceipt() async {
//     // try {
//     //   _status = ProfileBankDataStateStatus.loading;
//     //   final userId = GetIt.I<UserController>().user!.id;
//     //   bankReceipt = (await UserService().getUserById(userId!))!.bankReceipt;
//     //   _status = ProfileBankDataStateStatus.loaded;
//     // } catch (e, s) {
//     //   log('Erro ao buscar bancos', error: e, stackTrace: s);
//     //   _status = ProfileBankDataStateStatus.error;
//     //   _errorMessage = 'Erro ao buscar bancos';
//     // }
//   }

//   @action
//   Future<void> clearBankReceipt() async {
//     // try {
//     //   _status = ProfileBankDataStateStatus.loading;
//     //   final UserModel? usrMod = GetIt.I<UserController>().user;
//     //   await UserService().deleteField(usrMod!.id!, 'bankReceipt');
//     //   GetIt.I<UserController>().setUser(usrMod.copyWith(bankReceipt: null));
//     //   findBankReceipt();
//     // } catch (e, s) {
//     //   log('Erro ao buscar bancos', error: e, stackTrace: s);
//     //   _status = ProfileBankDataStateStatus.error;
//     //   _errorMessage = 'Erro ao buscar bancos';
//     // }
//   }
// }
