import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio _dio;
  UserRepositoryImpl(this._dio);

  @override
  Future<void> delete(String id) async {
    try {
      await _dio.auth().delete('user/$id');
    } on DioException catch (e, s) {
      log(
        'Erro ao apagar usuário',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao apagar usuário',
      );
    }
  }
}
