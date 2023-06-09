import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/extensions/validator_extensions.dart';
import '../../../../models/user_model.dart';
import '../../../../services/user/user_service.dart';
import '../../../auth/user_controller.dart';
part 'profile_my_documents_controller.g.dart';

enum ProfileMyDocumentsStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ProfileMyDocumentsController = ProfileMyDocumentsControllerBase
    with _$ProfileMyDocumentsController;

abstract class ProfileMyDocumentsControllerBase with Store {
  ProfileMyDocumentsControllerBase() {
    getUserData();
  }
  @readonly
  var _status = ProfileMyDocumentsStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? cpf;

  @observable
  String? rg;

  @observable
  String? orgaoEmissor;

  @observable
  String? dataEmissao;

  @action
  void setCPF(String value) => cpf = value;

  @action
  void setRG(String value) => rg = value;

  @action
  void setOrgaoEmissor(String value) => orgaoEmissor = value;

  @action
  void setDataEmissao(String value) => dataEmissao = value;

  @computed
  bool get cpfValid => cpf != null && cpf!.isCPFValid;
  String? get cpfError {
    if (!_showErrors || cpfValid) {
      return null;
    } else if (cpf == null || cpf!.isEmpty) {
      return 'CPF Obrigatório';
    } else if (!cpf!.isCPFValid) {
      return 'CPF inválido';
    } else {
      return 'CPF muito curto';
    }
  }

  @computed
  bool get rgValid => rg != null && rg!.length > 3;
  String? get rgError {
    if (!_showErrors || rgValid) {
      return null;
    } else if (rg == null || rg!.trim().isEmpty) {
      return 'RG Obrigatório';
    } else {
      return 'RG muito curto ';
    }
  }

  @computed
  bool get orgaoEmissorValid =>
      orgaoEmissor != null && orgaoEmissor!.length >= 2;
  String? get orgaoEmissorError {
    if (!_showErrors || orgaoEmissorValid) {
      return null;
    } else if (orgaoEmissor == null || orgaoEmissor!.isEmpty) {
      return 'Orgão Emissor Obrigatório';
    } else {
      return 'Orgão Emissor muito curto';
    }
  }

  @computed
  bool get dataEmissaoValid => dataEmissao != null && dataEmissao!.isNotEmpty;
  String? get dataEmissaoError {
    if (!_showErrors || dataEmissaoValid) {
      return null;
    } else {
      return 'Data de emissão obrigatória';
    }
  }

  @computed
  bool get isFormValid =>
      cpfValid && rgValid && orgaoEmissorValid && dataEmissaoValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? save : null;

  @action
  Future<void> save() async {
    try {
      _status = ProfileMyDocumentsStateStatus.loading;
      final UserModel? usrMod = GetIt.I<UserController>().user;
      final userSave = usrMod!.copyWith(
        cpf: cpf,
        rg: rg,
        orgaoEmissor: orgaoEmissor,
        dataEmissao: dataEmissao,
      );
      await UserService().update(userSave);
      GetIt.I<UserController>().setUser(userSave);
      _status = ProfileMyDocumentsStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = ProfileMyDocumentsStateStatus.error;
    }
  }

  @action
  Future<void> getUserData() async {
    final UserModel? usrMod = GetIt.I<UserController>().user;
    if (usrMod != null) {
      cpf = usrMod.cpf;
      rg = usrMod.rg;
      orgaoEmissor = usrMod.orgaoEmissor;
      dataEmissao = usrMod.dataEmissao;
    }
  }
}
