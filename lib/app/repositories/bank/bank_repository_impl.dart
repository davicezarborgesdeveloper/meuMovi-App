import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/bank_model.dart';
import 'bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  final CustomDio _dio;
  BankRepositoryImpl(this._dio);

  @override
  Future<List<BankModel>> getBankList() async {
    try {
      final result = await _dio.unauth().get(
            'external/banks',
          );

      final List<BankModel> listBankModel = <BankModel>[];
      for (var data in result.data) {
        if (data['code'] != null && data['fullName'] != null) {
          listBankModel.add(BankModel.fromMap(data));
        }
      }
      return listBankModel;
    } on DioException catch (e, s) {
      log('Erro ao buscar lista de bancos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar lista de bancos');
    }
  }
}
