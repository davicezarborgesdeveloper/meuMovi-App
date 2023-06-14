import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../repositories/zip/zip_repository.dart';
part 'profile_my_address_controller.g.dart';

enum ProfileMyAddressStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ProfileMyAddressController = ProfileMyAddressControllerBase
    with _$ProfileMyAddressController;

abstract class ProfileMyAddressControllerBase with Store {
  ProfileMyAddressControllerBase() {
    getUserData();
  }

  @readonly
  var _status = ProfileMyAddressStateStatus.initial;

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
    _status = ProfileMyAddressStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      city = address!.cidade.nome;
      state = address.estado.sigla;
      street = address.logradouro;
      district = address.bairro;
      _status = ProfileMyAddressStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = ProfileMyAddressStateStatus.error;
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
    // try {
    //   _status = ProfileMyAddressStateStatus.loading;
    //   final UserModelMod? usrMod = GetIt.I<UserController>().user;
    //   final userSave = usrMod!.copyWith(
    //     address: usrMod.address.copyWith(
    //       zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
    //       city: city,
    //       state: state,
    //       street: street,
    //       district: district,
    //       number: number,
    //       complement: complement,
    //       referencePoint: referencePoint,
    //     ),
    //   );
    //   await UserService().update(userSave);
    //   GetIt.I<UserController>().setUser(userSave);
    //   _status = ProfileMyAddressStateStatus.saved;
    // } on Exception catch (e, s) {
    //   log('Erro ao atualizar usuário', error: e, stackTrace: s);
    //   _errorMessage = 'Erro ao atualizar usuário';
    //   _status = ProfileMyAddressStateStatus.error;
    // }
  }

  @action
  Future<void> getUserData() async {
    // final UserModelMod? usrMod = GetIt.I<UserController>().user;
    // if (usrMod != null) {
    //   zip = usrMod.address.zip;
    //   city = usrMod.address.city;
    //   state = usrMod.address.state;
    //   street = usrMod.address.street;
    //   district = usrMod.address.district;
    //   number = usrMod.address.number;
    //   complement = usrMod.address.complement;
    //   referencePoint = usrMod.address.referencePoint;
    // }
  }
}
