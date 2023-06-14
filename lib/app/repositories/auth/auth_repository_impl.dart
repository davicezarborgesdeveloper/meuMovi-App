// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import '../../models/new/service_taker_model.dart';
import '../../models/new/syndicate_model.dart';
import '../../models/new/worker_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<AuthModel?> registerWorker(WorkerModel user) async {
    try {
      final result = await dio.unauth().post('/worker', data: user.toJson());
      return AuthModel(
        displayName:
            '${result.data['result']['name']} ${result.data['result']['lastname']}',
        userId: result.data['result']['user'],
        accessToken: result.data['token'],
      );
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar trabalhador');
    }
  }

  @override
  Future<AuthModel?> registerServiceTaker(ServiceTakerModel user) async {
    try {
      final result =
          await dio.unauth().post('/serviceTaker', data: user.toJson());
      return AuthModel(
        displayName: result.data['result']['companyName'],
        userId: result.data['result']['user'],
        accessToken: result.data['token'],
      );
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<AuthModel?> registerSyndicate(SyndicateModel user) async {
    try {
      final result = await dio.unauth().post('/syndicate', data: user.toJson());
      return AuthModel(
        displayName: result.data['result']['companyData']['fantasyName'],
        userId: result.data['result']['user'],
        accessToken: result.data['token'],
      );
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<AuthModel?> login(String user, String password) async {
    try {
      final result = await dio
          .unauth()
          .post('/login', data: {'login': user, 'password': password});
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('${e.response}', error: e, stackTrace: s);
      throw RepositoryException(message: '${e.response}');
    }
  }
}
