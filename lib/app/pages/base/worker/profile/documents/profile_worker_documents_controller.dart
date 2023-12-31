import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/extensions/validator_extensions.dart';
import '../../../../../models/worker_model.dart';
import '../../../../../services/worker/worker_service.dart';
import '../../../../auth/user_controller.dart';
part 'profile_worker_documents_controller.g.dart';

enum ProfileWorkerDocumentsStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ProfileWorkerDocumentsController = ProfileWorkerDocumentsControllerBase
    with _$ProfileWorkerDocumentsController;

abstract class ProfileWorkerDocumentsControllerBase with Store {
  ProfileWorkerDocumentsControllerBase() {
    getData();
  }
  @readonly
  var _status = ProfileWorkerDocumentsStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? cpf;

  @observable
  String? rg;

  @observable
  String? orgaoEmissor;

  @observable
  String? dataEmissao;

  @observable
  EmployeerModel? employeer;

  @action
  void setCPF(String value) => cpf = value;

  @action
  void setRG(String value) => rg = value;

  @action
  void setOrgaoEmissor(String value) => orgaoEmissor = value;

  @action
  void setDataEmissao(String value) => dataEmissao = value;

  @action
  void setEmployeer(EmployeerModel? value) => employeer = value;

  @computed
  bool get cpfValid => cpf != null && cpf!.isCPFValid;
  String? get cpfError {
    if (!_showErrors || cpfValid) {
      return null;
    } else if (cpf == null || cpf!.isEmpty) {
      return 'CPF Obrigatório';
    } else if (!cpf!.isCPFValid) {
      return 'CPF inválido';
    } else {
      return 'CPF muito curto';
    }
  }

  @computed
  bool get rgValid => rg != null && rg!.length > 3;
  String? get rgError {
    if (!_showErrors || rgValid) {
      return null;
    } else if (rg == null || rg!.trim().isEmpty) {
      return 'RG Obrigatório';
    } else {
      return 'RG muito curto ';
    }
  }

  @computed
  bool get orgaoEmissorValid =>
      orgaoEmissor != null && orgaoEmissor!.length >= 2;
  String? get orgaoEmissorError {
    if (!_showErrors || orgaoEmissorValid) {
      return null;
    } else if (orgaoEmissor == null || orgaoEmissor!.isEmpty) {
      return 'Orgão Emissor Obrigatório';
    } else {
      return 'Orgão Emissor muito curto';
    }
  }

  @computed
  bool get dataEmissaoValid => dataEmissao != null && dataEmissao!.isNotEmpty;
  String? get dataEmissaoError {
    if (!_showErrors || dataEmissaoValid) {
      return null;
    } else {
      return 'Data de emissão obrigatória';
    }
  }

  @computed
  bool get employeerValid => employeer != null;
  String? get employeerError {
    if (!_showErrors || employeerValid) {
      return null;
    } else {
      return 'Empregadora obrigatória';
    }
  }

  @computed
  bool get isFormValid =>
      cpfValid && rgValid && orgaoEmissorValid && dataEmissaoValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? save : null;

  @action
  Future<void> save() async {
    try {
      _status = ProfileWorkerDocumentsStateStatus.loading;
      final dt = DateFormat('dd/MM/yyyy').parse(dataEmissao!);
      final getData = GetIt.I<UserController>().worker;
      final saveData = getData!.copyWith(
        documents: DocumentsModel(
          cpf: cpf!.replaceAll(RegExp(r'[^0-9]'), ''),
          rg: rg!,
          orgaoEmissor: orgaoEmissor!,
          dataEmissao: DateFormat('yyyy-MM-dd').format(dt),
          employeer: EmployeerModel(
            code: employeer!.code,
            name: employeer!.name,
          ),
        ),
      );
      await WorkerService().workerUpdate(saveData);
      GetIt.I<UserController>().setWorker(saveData);
      _status = ProfileWorkerDocumentsStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = ProfileWorkerDocumentsStateStatus.error;
    }
  }

  @action
  Future<void> getData() async {
    _status = ProfileWorkerDocumentsStateStatus.loading;
    final data = GetIt.I<UserController>().worker;
    late final DateTime dt;
    if (data!.documents.dataEmissao != null &&
        data.documents.dataEmissao!.isNotEmpty) {
      dt = DateFormat('yyyy-MM-dd').parse(data.documents.dataEmissao!);
      dataEmissao = DateFormat('dd/MM/yyyy').format(dt);
    }
    cpf = data.documents.cpf.formattedCPF;
    rg = data.documents.rg;
    orgaoEmissor = data.documents.orgaoEmissor;

    employeer = data.documents.employeer != null
        ? EmployeerModel(
            code: data.documents.employeer!.code,
            name: data.documents.employeer!.name,
          )
        : EmployeerModel(code: '', name: '');
    _status = ProfileWorkerDocumentsStateStatus.loaded;
  }
}
