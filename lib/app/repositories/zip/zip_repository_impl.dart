import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/search_address.dart';
import 'zip_repository.dart';

class ZipRepositoryImpl implements ZipRepository {
  final CustomDio _dio;
  ZipRepositoryImpl(this._dio);
  @override
  Future<SearchAddress?> getAddressFromZip(String zipCode) async {
    try {
      final clearZip = zipCode.replaceAll(RegExp('[^0-9]'), '');
      final result = await _dio.unauth().get(
            'external/zip/$clearZip',
            options: Options(
              headers: {
                'Authorization': 'Token token=2d4d83796dfe8c93d64d080bb6a38934'
              },
            ),
          );
      if (result.data['success']) {
        return SearchAddress.fromMap(result.data['result']);
      } else {
        throw RepositoryException(message: 'Erro ao buscar endereço');
      }
    } on DioException catch (e, s) {
      log('Erro ao buscar endereço', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar endereço');
    }
  }
}
