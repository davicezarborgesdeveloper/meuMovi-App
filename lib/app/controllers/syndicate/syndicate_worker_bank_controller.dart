import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../models/worker_model.dart';
import '../../services/worker/worker_service.dart';
import '../http_controller.dart';
part 'syndicate_worker_bank_controller.g.dart';

enum SyndicateWorkerBankStateStatus {
  initial,
  loading,
  loaded,
  error,
  update,
}

class SyndicateWorkerBankController = SyndicateWorkerBankControllerBase
    with _$SyndicateWorkerBankController;

abstract class SyndicateWorkerBankControllerBase with Store {
  @readonly
  var _status = SyndicateWorkerBankStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  BankDataModel? bankData;

  @readonly
  WorkerModel? _workerModel;

  @action
  void setBankData(BankDataModel value) => bankData = value;

  @action
  Future<void> getBankReceipt(WorkerModel worker) async {
    try {
      _status = SyndicateWorkerBankStateStatus.loading;
      _workerModel = worker;
      bankData = worker.bankData;
      _status = SyndicateWorkerBankStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar bancos', error: e, stackTrace: s);
      _status = SyndicateWorkerBankStateStatus.error;
      _errorMessage = 'Erro ao buscar bancos';
    }
  }

  @action
  Future<void> clearBankReceipt() async {
    try {
      _status = SyndicateWorkerBankStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await WorkerService(dio).deleteBankData(_workerModel!.user!);
      bankData = null;
      _workerModel = _workerModel!.copyWith(bankData: null);
      _status = SyndicateWorkerBankStateStatus.update;
    } catch (e, s) {
      log('Erro ao deletar informações Bancárias', error: e, stackTrace: s);
      _status = SyndicateWorkerBankStateStatus.error;
      _errorMessage = 'Erro ao deletar informações Bancárias';
    }
  }
}
