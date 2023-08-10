import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/rest_client/custom_dio.dart';
import '../models/worker_model.dart';
import '../services/worker/worker_service.dart';
import 'http_controller.dart';
import 'user_controller.dart';
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
  void setBankData(BankDataModel value) => bankData = value;

  @action
  Future<void> getBankReceipt() async {
    try {
      _status = ProfileWorkerBankAccountStateStatus.loading;
      final worker = GetIt.I<UserController>().worker;
      bankData = worker!.bankData;
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
      final getData = GetIt.I<UserController>().worker;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await WorkerService(dio).deleteBankData(getData!.user!);
      GetIt.I<UserController>().setWorker(getData.copyWith(bankData: null));
      bankData = null;
      _status = ProfileWorkerBankAccountStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao deletar informações Bancárias', error: e, stackTrace: s);
      _status = ProfileWorkerBankAccountStateStatus.error;
      _errorMessage = 'Erro ao deletar informações Bancárias';
    }
  }
}
