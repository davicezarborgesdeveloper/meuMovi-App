import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/worker_model.dart';
import 'worker_repository.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final CustomDio _dio;
  WorkerRepositoryImpl(this._dio);
  @override
  Future<void> save(WorkerModel worker) async {
    try {
      await _dio.unauth().post('user', data: worker.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar trabalhador');
    }
  }

  @override
  Future<WorkerModel?> getByToken(String token) async {
    try {
      final result = await _dio.auth().get('user');
      return WorkerModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log(
        'Erro ao realizar carregar informações do usuário',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao realizar carregar informações do usuário',
      );
    }
  }

  @override
  Future<List<WorkerModel>> getWorkersBySyndicate([String? userId]) async {
    {
      final result = await _dio.auth().get('user/3/$userId');
      final List<WorkerModel> listWorker = <WorkerModel>[];
      for (var data in result.data) {
        listWorker.add(WorkerModel.fromMap(data));
      }
      return listWorker;
    }
  }

  @override
  Future<void> update(WorkerModel worker, String updateType) async {
    try {
      var map = {};
      if (updateType == 'PD') {
        final dt = DateFormat('dd/MM/yyyy').parse(worker.personal.birthdate);
        map = {
          'id': worker.id,
          'profileType': worker.profileType,
          'password': worker.password.isNotEmpty ? worker.password : '',
          'name': worker.name,
          'lastname': worker.lastname,
          'surname': worker.personal.surname,
          'birthdate': DateFormat('yyyy-MM-dd').format(dt),
          'motherName': worker.personal.motherName,
          'maritalStatus': worker.personal.maritalStatus!.acronym,
          'phone': worker.personal.phone,
          'email': worker.personal.email,
          'updateType': 'PD'
        };
      } else if (updateType == 'DC') {
        final dt =
            DateFormat('dd/MM/yyyy').parse(worker.documents.dataEmissao!);
        map = {
          'id': worker.id,
          'profileType': worker.profileType,
          'updateType': 'DC',
          'cpf': worker.documents.cpf,
          'rg': worker.documents.rg,
          'orgaoEmissor': worker.documents.orgaoEmissor,
          'dataEmissao': DateFormat('yyyy-MM-dd').format(dt),
          'employeer': worker.documents.employeer!.code
        };
      } else if (updateType == 'AD') {
        map = {
          'id': worker.id,
          'profileType': worker.profileType,
          'zip': worker.address.zip,
          'city': worker.address.city,
          'state': worker.address.state,
          'street': worker.address.street,
          'district': worker.address.district,
          'number': worker.address.number,
          'complement': worker.address.complement,
          'referencePoint': worker.address.referencePoint,
          'updateType': 'AD'
        };
      } else if (updateType == 'BK') {
        map = {
          'id': worker.id,
          'profileType': worker.profileType,
          'updateType': 'BK',
          'bankReceiptType': worker.bankData?.bankReceiptType!.acronym,
          'pixKey': worker.bankData?.pixKey,
          'pixKeyType': worker.bankData!.pixKeyType?.acronym,
          'account': worker.bankData?.account,
          'accountType': worker.bankData?.accountType?.acronym,
          'agency': worker.bankData?.agency,
          'bankName': worker.bankData?.bankName,
          'cardholderName': worker.bankData?.cardholderName,
          'holdersCPF': worker.bankData?.holdersCPF,
          'verifyingDigit': worker.bankData?.verifyingDigit
        };
      }
      await _dio.auth().put('user', data: map);
    } on DioException catch (e, s) {
      log(
        'Erro ao atualizar dados do trabalhador',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao atualizar dados do trabalhador',
      );
    }
  }

  @override
  Future<void> deleteBankData(String userId) async {
    try {
      await _dio.auth().delete('user/bank/$userId');
    } on DioException catch (e, s) {
      log('Erro ao deletar informações Bancárias', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao deletar informações Bancárias',
      );
    }
  }

  @override
  Future<void> delete(String userId) async {
    try {
      await _dio.auth().delete('user/$userId');
    } on DioException catch (e, s) {
      log(
        'Erro ao apagar tabalhador',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao apagar tabalhador',
      );
    }
  }
}
