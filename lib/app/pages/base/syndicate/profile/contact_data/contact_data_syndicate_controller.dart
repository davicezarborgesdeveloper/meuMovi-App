import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/extensions/validator_extensions.dart';
import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../models/syndicate_model.dart';
import '../../../../../services/syndicate/syndicate_service.dart';
import '../../../../auth/user_controller.dart';
part 'contact_data_syndicate_controller.g.dart';

enum ContactDataSyndicateStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ContactDataSyndicateController = ContactDataSyndicateControllerBase
    with _$ContactDataSyndicateController;

abstract class ContactDataSyndicateControllerBase with Store {
  ContactDataSyndicateControllerBase() {
    getData();
  }
  @readonly
  var _status = ContactDataSyndicateStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? mobilePhone;

  @observable
  CompanySector? companySector;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setMobilePhone(String value) => mobilePhone = value;

  @action
  void setCompanySector(CompanySector? value) => companySector = value;

  @computed
  bool get nameValid => name != null && name!.length > 3;
  String? get nameError {
    if (!_showErrors || nameValid) {
      return null;
    } else if (name == null || name!.isEmpty) {
      return 'Nome Obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @computed
  bool get phoneValid => phone != null && phone!.isPhoneValid;
  String? get phoneError {
    if (!_showErrors || phoneValid) {
      return null;
    } else if (phone == null || phone!.isEmpty) {
      return 'Telefone Obrigatório';
    } else {
      return 'Telefone muito curto';
    }
  }

  @computed
  bool get mobilePhoneValid => mobilePhone != null && mobilePhone!.isPhoneValid;
  String? get mobilePhoneError {
    if (!_showErrors || phoneValid) {
      return null;
    } else if (mobilePhone == null || mobilePhone!.isEmpty) {
      return 'Celular Obrigatório';
    } else {
      return 'Celular muito curto';
    }
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @computed
  bool get isFormValid => nameValid && (phoneValid || mobilePhoneValid);

  @action
  Future<void> getData() async {
    try {
      _status = ContactDataSyndicateStateStatus.loading;
      final data = GetIt.I<UserController>().syndicate;
      name = data!.responsibleContact.name;
      email = data.responsibleContact.email;
      phone = data.responsibleContact.phone.formattedPhone;
      mobilePhone = data.responsibleContact.mobile.formattedPhone;
      companySector = CompanySector.parse(data.responsibleContact.sector);
      _status = ContactDataSyndicateStateStatus.loaded;
    } on Exception catch (e, s) {
      log('Erro ao buscar informações do sindicato', error: e, stackTrace: s);
      _errorMessage = 'Erro ao buscar informações do sindicato';
      _status = ContactDataSyndicateStateStatus.error;
    }
  }

  @action
  Future<void> register() async {
    _status = ContactDataSyndicateStateStatus.loading;
    try {
      final getData = GetIt.I<UserController>().syndicate;
      final saveData = getData!.copyWith(
        responsibleContact: ResponsibleContact(
          name: name!,
          email: email!,
          phone: phone == null ? '' : phone!.replaceAll(RegExp(r'[^0-9]'), ''),
          mobile: mobilePhone == null
              ? ''
              : mobilePhone!.replaceAll(RegExp(r'[^0-9]'), ''),
          sector: companySector!.acronym,
        ),
      );
      await SyndicateService().syndicateUpdate(saveData);
      _status = ContactDataSyndicateStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = ContactDataSyndicateStateStatus.error;
    }
  }
}
