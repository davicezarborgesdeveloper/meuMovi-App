import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../models/worker_model.dart';
import '../../../../../services/user/user_service.dart';
import '../../../../auth/user_controller.dart';
part 'profile_worker_bank_account_controller.g.dart';

enum ProfileWorkerBankAccountStateStatus {
  initial,
  loading,
  loaded,
  error,
  update,
}

class ProfileWorkerBankAccountController = ProfileWorkerBankAccountControllerBase
    with _$ProfileWorkerBankAccountController;

abstract class ProfileWorkerBankAccountControllerBase with Store {
  @readonly
  var _status = ProfileWorkerBankAccountStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  BankDataModel? bankData;

  @action
  Future<void> getBankReceipt() async {
    try {
      _status = ProfileWorkerBankAccountStateStatus.loading;
      final userId = (GetIt.I<UserController>().user as WorkerModel).user;
      bankData =
          (await UserService().getUserById(userId!) as WorkerModel).bankData;
      _status = ProfileWorkerBankAccountStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar bancos', error: e, stackTrace: s);
      _status = ProfileWorkerBankAccountStateStatus.error;
      _errorMessage = 'Erro ao buscar bancos';
    }
  }

  @action
  Future<void> clearBankReceipt() async {
    try {
      _status = ProfileWorkerBankAccountStateStatus.loading;
      final getData = GetIt.I<UserController>().user as WorkerModel;
      await UserService().deleteField(getData.user!, 'bankData');
      GetIt.I<UserController>().setUser(getData.copyWith(bankData: null));
      getBankReceipt();
    } catch (e, s) {
      log('Erro ao buscar bancos', error: e, stackTrace: s);
      _status = ProfileWorkerBankAccountStateStatus.error;
      _errorMessage = 'Erro ao buscar bancos';
    }
  }
}
