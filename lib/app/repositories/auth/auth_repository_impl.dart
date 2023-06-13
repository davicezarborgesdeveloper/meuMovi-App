// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/new/service_taker_model.dart';
import '../../models/new/syndicate_model.dart';
import '../../models/new/user_model.dart';
import '../../models/new/worker_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<UserModel?> registerWorker(WorkerModel user) async {
    try {
      final result = await dio.unauth().post('/worker', data: user.toJson());
      return WorkerModel.fromMap(result.data['result']);
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<UserModel?> registerServiceTaker(ServiceTakerModel user) async {
    try {
      final result =
          await dio.unauth().post('/serviceTaker', data: user.toJson());
      return ServiceTakerModel.fromMap(result.data['result']);
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<UserModel?> registerSyndicate(SyndicateModel user) async {
    try {
      final result = await dio.unauth().post('/worker', data: user.toJson());
      return SyndicateModel.fromMap(result.data['result']);
    } on DioError catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> login(String user, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
