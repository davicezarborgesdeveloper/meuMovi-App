import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../../../repositories/zip/zip_repository.dart';
import '../../../../../../services/worker/worker_service.dart';
part 'address_data_controller.g.dart';

enum AddressDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class AddressDataController = AddressDataControllerBase
    with _$AddressDataController;

abstract class AddressDataControllerBase with Store {
  @readonly
  var _status = AddressDataStateStatus.initial;

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
    _status = AddressDataStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      city = address!.cidade.nome;
      state = address.estado.sigla;
      street = address.logradouro;
      district = address.bairro;
      _status = AddressDataStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = AddressDataStateStatus.error;
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
      _status = AddressDataStateStatus.loading;
      final getData = _workerModel;
      final saveData = getData!.copyWith(
        address: getData.address.copyWith(
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
      await WorkerService().workerUpdate(saveData);
      _workerModel = saveData;
      _status = AddressDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = AddressDataStateStatus.error;
    }
  }

  @action
  Future<void> getData(WorkerModel worker) async {
    _status = AddressDataStateStatus.loading;
    _workerModel = worker;
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
