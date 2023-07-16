import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../models/address_model.dart';
import '../../../../../repositories/zip/zip_repository.dart';
import '../../../../../services/syndicate/syndicate_service.dart';
import '../../../../auth/user_controller.dart';
part 'address_data_syndicate_controller.g.dart';

enum AddressDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class AddressDataSyndicateController = AddressDataSyndicateControllerBase
    with _$AddressDataSyndicateController;

abstract class AddressDataSyndicateControllerBase with Store {
  AddressDataSyndicateControllerBase() {
    getData();
  }

  @readonly
  var _status = AddressDataStateStatus.initial;

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
    _status = AddressDataStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      city = address!.cidade;
      state = address.estado;
      street = address.logradouro;
      district = address.bairro;
      _status = AddressDataStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = AddressDataStateStatus.error;
    }
  }

  @action
  Future<void> getData() async {
    final data = GetIt.I<UserController>().syndicate;
    zip = data!.address.zip.formattedZip;
    city = data.address.city;
    state = data.address.state;
    street = data.address.street;
    district = data.address.district;
    number = data.address.number;
    complement = data.address.complement;
  }

  @action
  Future<void> register() async {
    _status = AddressDataStateStatus.loading;
    try {
      final getData = GetIt.I<UserController>().syndicate;
      final saveData = getData!.copyWith(
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
      await SyndicateService().syndicateUpdate(saveData);
      _status = AddressDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = AddressDataStateStatus.error;
    }
  }
}
