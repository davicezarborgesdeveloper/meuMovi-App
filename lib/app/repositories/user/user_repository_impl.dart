import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/new/service_taker_model.dart';
import '../../models/new/syndicate_model.dart';
import '../../models/new/user_model.dart';
import '../../models/new/worker_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({
    required this.dio,
  });
  @override
  Future<UserModel?> getUserById(String id) async {
    try {
      final result = await dio.auth().get('/user');
      switch (result.data['result']['profileType']) {
        case 0:
          return WorkerModel.fromMap(result.data['result']);
        case 1:
          return ServiceTakerModel.fromMap(result.data['result']);
        case 2:
          return SyndicateModel.fromMap(result.data['result']);
        default:
          return null;
      }
    } on DioError catch (e, s) {
      log('${e.response}', error: e, stackTrace: s);
      throw RepositoryException(message: '${e.response}');
    }
  }
}
