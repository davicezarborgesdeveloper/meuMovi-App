import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../../core/extensions/validator_extensions.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../../../services/worker/worker_service.dart';
part 'document_data_controller.g.dart';

enum DocumentDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class DocumentDataController = DocumentDataControllerBase
    with _$DocumentDataController;

abstract class DocumentDataControllerBase with Store {
  @readonly
  var _status = DocumentDataStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @readonly
  WorkerModel? _workerModel;

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
      _status = DocumentDataStateStatus.loading;
      final dt = DateFormat('dd/MM/yyyy').parse(dataEmissao!);
      final getData = _workerModel;
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
      _workerModel = saveData;
      _status = DocumentDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = DocumentDataStateStatus.error;
    }
  }

  @action
  Future<void> getData(WorkerModel worker) async {
    _status = DocumentDataStateStatus.loading;
    _workerModel = worker;
    late final DateTime dt;
    if (worker.documents.dataEmissao != null &&
        worker.documents.dataEmissao!.isNotEmpty) {
      dt = DateFormat('yyyy-MM-dd').parse(worker.documents.dataEmissao!);
      dataEmissao = DateFormat('dd/MM/yyyy').format(dt);
    }
    cpf = worker.documents.cpf.formattedCPF;
    rg = worker.documents.rg;
    orgaoEmissor = worker.documents.orgaoEmissor;

    employeer = worker.documents.employeer != null
        ? EmployeerModel(
            code: worker.documents.employeer!.code,
            name: worker.documents.employeer!.name,
          )
        : EmployeerModel(code: '', name: '');
    _status = DocumentDataStateStatus.loaded;
  }
}
