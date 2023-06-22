// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_taker_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceTakerListController on ServiceTakerListControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ServiceTakerListControllerBase._status', context: context);

  ServiceTakerListStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ServiceTakerListStateStatus get _status => status;

  @override
  set _status(ServiceTakerListStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ServiceTakerListControllerBase._errorMessage', context: context);

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

  late final _$_serviceTakerAtom = Atom(
      name: 'ServiceTakerListControllerBase._serviceTaker', context: context);

  List<ServiceTakerModel> get serviceTaker {
    _$_serviceTakerAtom.reportRead();
    return super._serviceTaker;
  }

  @override
  List<ServiceTakerModel> get _serviceTaker => serviceTaker;

  @override
  set _serviceTaker(List<ServiceTakerModel> value) {
    _$_serviceTakerAtom.reportWrite(value, super._serviceTaker, () {
      super._serviceTaker = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
