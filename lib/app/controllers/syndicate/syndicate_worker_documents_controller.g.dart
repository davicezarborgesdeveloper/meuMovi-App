// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_documents_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerDocumentsController
    on SyndicateWorkerDocumentsControllerBase, Store {
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid =>
      (_$cpfValidComputed ??= Computed<bool>(() => super.cpfValid,
              name: 'SyndicateWorkerDocumentsControllerBase.cpfValid'))
          .value;
  Computed<bool>? _$rgValidComputed;

  @override
  bool get rgValid => (_$rgValidComputed ??= Computed<bool>(() => super.rgValid,
          name: 'SyndicateWorkerDocumentsControllerBase.rgValid'))
      .value;
  Computed<bool>? _$orgaoEmissorValidComputed;

  @override
  bool get orgaoEmissorValid => (_$orgaoEmissorValidComputed ??= Computed<bool>(
          () => super.orgaoEmissorValid,
          name: 'SyndicateWorkerDocumentsControllerBase.orgaoEmissorValid'))
      .value;
  Computed<bool>? _$dataEmissaoValidComputed;

  @override
  bool get dataEmissaoValid => (_$dataEmissaoValidComputed ??= Computed<bool>(
          () => super.dataEmissaoValid,
          name: 'SyndicateWorkerDocumentsControllerBase.dataEmissaoValid'))
      .value;
  Computed<bool>? _$employeerValidComputed;

  @override
  bool get employeerValid =>
      (_$employeerValidComputed ??= Computed<bool>(() => super.employeerValid,
              name: 'SyndicateWorkerDocumentsControllerBase.employeerValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SyndicateWorkerDocumentsControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'SyndicateWorkerDocumentsControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase._status', context: context);

  SyndicateWorkerDocumentsStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerDocumentsStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerDocumentsStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase._errorMessage',
      context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_showErrorsAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase._showErrors',
      context: context);

  bool get showErrors {
    _$_showErrorsAtom.reportRead();
    return super._showErrors;
  }

  @override
  bool get _showErrors => showErrors;

  @override
  set _showErrors(bool value) {
    _$_showErrorsAtom.reportWrite(value, super._showErrors, () {
      super._showErrors = value;
    });
  }

  late final _$_workerModelAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase._workerModel',
      context: context);

  WorkerModel? get workerModel {
    _$_workerModelAtom.reportRead();
    return super._workerModel;
  }

  @override
  WorkerModel? get _workerModel => workerModel;

  @override
  set _workerModel(WorkerModel? value) {
    _$_workerModelAtom.reportWrite(value, super._workerModel, () {
      super._workerModel = value;
    });
  }

  late final _$cpfAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$rgAtom =
      Atom(name: 'SyndicateWorkerDocumentsControllerBase.rg', context: context);

  @override
  String? get rg {
    _$rgAtom.reportRead();
    return super.rg;
  }

  @override
  set rg(String? value) {
    _$rgAtom.reportWrite(value, super.rg, () {
      super.rg = value;
    });
  }

  late final _$orgaoEmissorAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase.orgaoEmissor',
      context: context);

  @override
  String? get orgaoEmissor {
    _$orgaoEmissorAtom.reportRead();
    return super.orgaoEmissor;
  }

  @override
  set orgaoEmissor(String? value) {
    _$orgaoEmissorAtom.reportWrite(value, super.orgaoEmissor, () {
      super.orgaoEmissor = value;
    });
  }

  late final _$dataEmissaoAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase.dataEmissao',
      context: context);

  @override
  String? get dataEmissao {
    _$dataEmissaoAtom.reportRead();
    return super.dataEmissao;
  }

  @override
  set dataEmissao(String? value) {
    _$dataEmissaoAtom.reportWrite(value, super.dataEmissao, () {
      super.dataEmissao = value;
    });
  }

  late final _$employeerAtom = Atom(
      name: 'SyndicateWorkerDocumentsControllerBase.employeer',
      context: context);

  @override
  EmployeerModel? get employeer {
    _$employeerAtom.reportRead();
    return super.employeer;
  }

  @override
  set employeer(EmployeerModel? value) {
    _$employeerAtom.reportWrite(value, super.employeer, () {
      super.employeer = value;
    });
  }

  late final _$saveAsyncAction = AsyncAction(
      'SyndicateWorkerDocumentsControllerBase.save',
      context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getUserDataAsyncAction = AsyncAction(
      'SyndicateWorkerDocumentsControllerBase.getUserData',
      context: context);

  @override
  Future<void> getUserData(WorkerModel worker) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(worker));
  }

  late final _$SyndicateWorkerDocumentsControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerDocumentsControllerBase', context: context);

  @override
  void setCPF(String value) {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRG(String value) {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.setRG');
    try {
      return super.setRG(value);
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setOrgaoEmissor(String value) {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.setOrgaoEmissor');
    try {
      return super.setOrgaoEmissor(value);
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDataEmissao(String value) {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.setDataEmissao');
    try {
      return super.setDataEmissao(value);
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmployeer(EmployeerModel? value) {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.setEmployeer');
    try {
      return super.setEmployeer(value);
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$SyndicateWorkerDocumentsControllerBaseActionController.startAction(
            name: 'SyndicateWorkerDocumentsControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SyndicateWorkerDocumentsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
rg: ${rg},
orgaoEmissor: ${orgaoEmissor},
dataEmissao: ${dataEmissao},
employeer: ${employeer},
cpfValid: ${cpfValid},
rgValid: ${rgValid},
orgaoEmissorValid: ${orgaoEmissorValid},
dataEmissaoValid: ${dataEmissaoValid},
employeerValid: ${employeerValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
