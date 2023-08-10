// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_taker_picker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceTakerPickerController
    on ServiceTakerPickerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ServiceTakerPickerControllerBase._status', context: context);

  ServiceTakerPickerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ServiceTakerPickerStateStatus get _status => status;

  @override
  set _status(ServiceTakerPickerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_serviceTakerListAtom = Atom(
      name: 'ServiceTakerPickerControllerBase._serviceTakerList',
      context: context);

  List<ServiceTakerModel> get serviceTakerList {
    _$_serviceTakerListAtom.reportRead();
    return super._serviceTakerList;
  }

  @override
  List<ServiceTakerModel> get _serviceTakerList => serviceTakerList;

  @override
  set _serviceTakerList(List<ServiceTakerModel> value) {
    _$_serviceTakerListAtom.reportWrite(value, super._serviceTakerList, () {
      super._serviceTakerList = value;
    });
  }

  late final _$serviceTakerSelectedAtom = Atom(
      name: 'ServiceTakerPickerControllerBase.serviceTakerSelected',
      context: context);

  @override
  ServiceTakerModel? get serviceTakerSelected {
    _$serviceTakerSelectedAtom.reportRead();
    return super.serviceTakerSelected;
  }

  @override
  set serviceTakerSelected(ServiceTakerModel? value) {
    _$serviceTakerSelectedAtom.reportWrite(value, super.serviceTakerSelected,
        () {
      super.serviceTakerSelected = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ServiceTakerPickerControllerBase._errorMessage', context: context);

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

  late final _$findServiceTakerAsyncAction = AsyncAction(
      'ServiceTakerPickerControllerBase.findServiceTaker',
      context: context);

  @override
  Future<void> findServiceTaker(String? userId) {
    return _$findServiceTakerAsyncAction
        .run(() => super.findServiceTaker(userId));
  }

  late final _$ServiceTakerPickerControllerBaseActionController =
      ActionController(
          name: 'ServiceTakerPickerControllerBase', context: context);

  @override
  void setServiceTakerSelected(ServiceTakerModel value) {
    final _$actionInfo =
        _$ServiceTakerPickerControllerBaseActionController.startAction(
            name: 'ServiceTakerPickerControllerBase.setServiceTakerSelected');
    try {
      return super.setServiceTakerSelected(value);
    } finally {
      _$ServiceTakerPickerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceTakerSelected: ${serviceTakerSelected}
    ''';
  }
}
