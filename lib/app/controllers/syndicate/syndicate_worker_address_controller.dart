import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/extensions/formatter_extensions.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/address_model.dart';
import '../../models/worker_model.dart';
import '../../repositories/zip/zip_repository.dart';
import '../../services/worker/worker_service.dart';
import '../http_controller.dart';
part 'syndicate_worker_address_controller.g.dart';

enum SyndicateWorkerAddressStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class SyndicateWorkerAddressController = SyndicateWorkerAddressControllerBase
    with _$SyndicateWorkerAddressController;

abstract class SyndicateWorkerAddressControllerBase with Store {
  @readonly
  var _status = SyndicateWorkerAddressStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @readonly
  WorkerModel? _workerModel;

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
  bool termsAccepted = false;

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

  @computed
  bool get isFormValid => zipValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = SyndicateWorkerAddressStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final address = await ZipRepository(dio).getAddressFromZip(zipFilter);
      city = address!.cidade;
      state = address.estado;
      street = address.logradouro;
      district = address.bairro;
      _status = SyndicateWorkerAddressStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = SyndicateWorkerAddressStateStatus.error;
    }
  }

  @action
  Future<void> getData(WorkerModel worker) async {
    _status = SyndicateWorkerAddressStateStatus.loading;
    _workerModel = worker;
    zip = worker.address.zip.formattedZip;
    city = worker.address.city;
    state = worker.address.state;
    street = worker.address.street;
    district = worker.address.district;
    number = worker.address.number;
    complement = worker.address.complement;
  }

  @action
  Future<void> register() async {
    _status = SyndicateWorkerAddressStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final data = _workerModel;
      final user = data!.copyWith(
        address: AddressModel(
          zip: zip == null ? '' : zip!.replaceAll(RegExp(r'[^0-9]'), ''),
          city: city!,
          state: state!,
          street: street!,
          district: district!,
          number: number!,
          complement: complement!,
        ),
      );
      _workerModel = user;
      await WorkerService(dio).update(user, 'AD');
      _status = SyndicateWorkerAddressStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = SyndicateWorkerAddressStateStatus.error;
    }
  }
}
