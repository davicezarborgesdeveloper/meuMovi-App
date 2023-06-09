import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/bank_model.dart';
import './banks_repository.dart';

class BanksRepositoryImpl implements BanksRepository {
  @override
  Future<List<BankModel>> getBankList() async {
    final Dio dio = Dio();
    try {
      final result = await dio.get(
        'https://brasilapi.com.br/api/banks/v1',
      );

      final List<BankModel> listBankModel = <BankModel>[];
      for (var data in result.data) {
        if (data['code'] != null && data['fullName'] != null) {
          listBankModel.add(BankModel.fromMap(data));
        }
      }
      return listBankModel;
    } on DioError catch (e, s) {
      log('Erro ao buscar lista de bancos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar lista de bancos');
    }
  }
}
