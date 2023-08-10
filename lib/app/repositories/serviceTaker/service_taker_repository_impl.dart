import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/service_taker_model.dart';
import 'service_taker_repository.dart';

class ServiceTakerRepositoryImpl implements ServiceTakerRepository {
  final CustomDio _dio;
  ServiceTakerRepositoryImpl(this._dio);

  @override
  Future<void> save(ServiceTakerModel serviceTaker) async {
    try {
      await _dio.unauth().post('user', data: serviceTaker.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar tomadora', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar tomadora');
    }
  }

  @override
  Future<ServiceTakerModel?> getByToken(String token) async {
    try {
      final result = await _dio.auth().get('user');
      return ServiceTakerModel.fromMap(result.data);
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
  Future<void> update(ServiceTakerModel serviceTaker) async {
    try {
      await _dio.auth().put('user', data: serviceTaker.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar tomadora', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar tomadora');
    }
  }

  @override
  Future<List<ServiceTakerModel>> getServiceTakerBySyndicate([
    String? userId,
  ]) async {
    final result = await _dio.auth().get('user/1/$userId');
    final List<ServiceTakerModel> listServiceTaker = <ServiceTakerModel>[];
    for (var data in result.data) {
      listServiceTaker.add(ServiceTakerModel.fromMap(data));
    }
    return listServiceTaker;
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _dio.auth().delete('user/$id');
    } on DioException catch (e, s) {
      log(
        'Erro ao apagar tomadora',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao apagar tomadora',
      );
    }
  }
}
// localhost:80/movi/user/1/87644636000154