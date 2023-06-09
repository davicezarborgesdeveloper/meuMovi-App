import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/address_cep_aberto.dart';
import './zip_repository.dart';

class ZipRepositoryImpl implements ZipRepository {
  @override
  Future<AddressCepAberto?> getAddressFromZip(String zipCode) async {
    final Dio dio = Dio();
    try {
      final clearZip = zipCode.replaceAll(RegExp('[^0-9]'), '');
      dio.options.headers['Authorization'] =
          'Token token=2d4d83796dfe8c93d64d080bb6a38934';
      final result = await dio.get(
        'https://www.cepaberto.com/api/v3/cep',
        queryParameters: {'cep': clearZip},
      );
      return AddressCepAberto.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar endereço', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar endereço');
    }
  }
}
