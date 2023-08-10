import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/extensions/formatter_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../models/worker_model.dart';
import '../repositories/zip/zip_repository.dart';
import '../services/worker/worker_service.dart';
import 'http_controller.dart';
import 'user_controller.dart';
part 'profile_worker_address_data_controller.g.dart';

enum ProfileWorkerAddressDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ProfileWorkerAddressDataController = ProfileWorkerAddressDataControllerBase
    with _$ProfileWorkerAddressDataController;

abstract class ProfileWorkerAddressDataControllerBase with Store {
  @readonly
  var _status = ProfileWorkerAddressDataStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? zip;

  @observable
  String? city;

  @observable
  String? state;

  @observable
  String? street;

  @observable
  String? district;

  @observable
  String? number;

  @observable
  String? complement;

  @observable
  String? referencePoint;

  @action
  void setZip(String value) => zip = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setState(String value) => state = value;

  @action
  void setStreet(String value) => street = value;

  @action
  void setDistrict(String value) => district = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setComplement(String value) => complement = value;

  @action
  void setReferencePoint(String value) => referencePoint = value;

  @computed
  bool get zipValid => zip != null && zip!.length >= 10;
  String? get zipError {
    if (!_showErrors || zipValid) {
      return null;
    } else if (zip == null || zip!.isEmpty) {
      return 'CEP Obrigatório';
    } else {
      return 'CEP muito curto';
    }
  }

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = ProfileWorkerAddressDataStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final address = await ZipRepository(dio).getAddressFromZip(zipFilter);
      city = address!.cidade;
      state = address.estado;
      street = address.logradouro;
      district = address.bairro;
      _status = ProfileWorkerAddressDataStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = ProfileWorkerAddressDataStateStatus.error;
    }
  }

  @computed
  bool get isFormValid => zipValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? save : null;

  @action
  Future<void> save() async {
    try {
      _status = ProfileWorkerAddressDataStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final data = GetIt.I<UserController>().worker;
      final user = data!.copyWith(
        address: data.address.copyWith(
          zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
          city: city,
          state: state,
          street: street,
          district: district,
          number: number,
          complement: complement,
          referencePoint: referencePoint,
        ),
      );
      await WorkerService(dio).update(user, 'AD');
      GetIt.I<UserController>().setWorker(user);
      _status = ProfileWorkerAddressDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = ProfileWorkerAddressDataStateStatus.error;
    }
  }

  @action
  Future<void> getUserData(WorkerModel worker) async {
    _status = ProfileWorkerAddressDataStateStatus.loading;
    zip = worker.address.zip.formattedZip;
    city = worker.address.city;
    state = worker.address.state;
    street = worker.address.street;
    district = worker.address.district;
    number = worker.address.number;
    complement = worker.address.complement;
    referencePoint = worker.address.referencePoint;
  }
}
