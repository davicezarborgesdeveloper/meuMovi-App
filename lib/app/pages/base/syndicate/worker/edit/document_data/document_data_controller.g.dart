// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DocumentDataController on DocumentDataControllerBase, Store {
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid =>
      (_$cpfValidComputed ??= Computed<bool>(() => super.cpfValid,
              name: 'DocumentDataControllerBase.cpfValid'))
          .value;
  Computed<bool>? _$rgValidComputed;

  @override
  bool get rgValid => (_$rgValidComputed ??= Computed<bool>(() => super.rgValid,
          name: 'DocumentDataControllerBase.rgValid'))
      .value;
  Computed<bool>? _$orgaoEmissorValidComputed;

  @override
  bool get orgaoEmissorValid => (_$orgaoEmissorValidComputed ??= Computed<bool>(
          () => super.orgaoEmissorValid,
          name: 'DocumentDataControllerBase.orgaoEmissorValid'))
      .value;
  Computed<bool>? _$dataEmissaoValidComputed;

  @override
  bool get dataEmissaoValid => (_$dataEmissaoValidComputed ??= Computed<bool>(
          () => super.dataEmissaoValid,
          name: 'DocumentDataControllerBase.dataEmissaoValid'))
      .value;
  Computed<bool>? _$employeerValidComputed;

  @override
  bool get employeerValid =>
      (_$employeerValidComputed ??= Computed<bool>(() => super.employeerValid,
              name: 'DocumentDataControllerBase.employeerValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'DocumentDataControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'DocumentDataControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'DocumentDataControllerBase._status', context: context);

  DocumentDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  DocumentDataStateStatus get _status => status;

  @override
  set _status(DocumentDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'DocumentDataControllerBase._errorMessage', context: context);

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

  late final _$_showErrorsAtom =
      Atom(name: 'DocumentDataControllerBase._showErrors', context: context);

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

  late final _$_workerModelAtom =
      Atom(name: 'DocumentDataControllerBase._workerModel', context: context);

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

  late final _$cpfAtom =
      Atom(name: 'DocumentDataControllerBase.cpf', context: context);

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
      Atom(name: 'DocumentDataControllerBase.rg', context: context);

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

  late final _$orgaoEmissorAtom =
      Atom(name: 'DocumentDataControllerBase.orgaoEmissor', context: context);

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

  late final _$dataEmissaoAtom =
      Atom(name: 'DocumentDataControllerBase.dataEmissao', context: context);

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

  late final _$employeerAtom =
      Atom(name: 'DocumentDataControllerBase.employeer', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('DocumentDataControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getDataAsyncAction =
      AsyncAction('DocumentDataControllerBase.getData', context: context);

  @override
  Future<void> getData(WorkerModel worker) {
    return _$getDataAsyncAction.run(() => super.getData(worker));
  }

  late final _$DocumentDataControllerBaseActionController =
      ActionController(name: 'DocumentDataControllerBase', context: context);

  @override
  void setCPF(String value) {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRG(String value) {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.setRG');
    try {
      return super.setRG(value);
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrgaoEmissor(String value) {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.setOrgaoEmissor');
    try {
      return super.setOrgaoEmissor(value);
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataEmissao(String value) {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.setDataEmissao');
    try {
      return super.setDataEmissao(value);
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmployeer(EmployeerModel? value) {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.setEmployeer');
    try {
      return super.setEmployeer(value);
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$DocumentDataControllerBaseActionController
        .startAction(name: 'DocumentDataControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$DocumentDataControllerBaseActionController.endAction(_$actionInfo);
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
