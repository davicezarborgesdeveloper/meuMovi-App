import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _dio;
  AuthRepositoryImpl(this._dio);
  @override
  Future<AuthModel?> login(String user, String password) async {
    try {
      final result = await _dio.unauth().post(
        'auth',
        data: {'login': user, 'password': password},
      );
      return AuthModel.fromMap(result.data);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Login ou senha inválidos', error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }
}