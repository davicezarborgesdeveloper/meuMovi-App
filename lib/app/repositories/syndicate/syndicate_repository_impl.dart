import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/syndicate_model.dart';
import 'syndicate_repository.dart';

class SyndicateRepositoryImpl implements SyndicateRepository {
  final CustomDio _dio;
  SyndicateRepositoryImpl(this._dio);

  @override
  Future<List<SyndicateModel>> findAll() async {
    final result = await _dio.unauth().get('user/2');
    final list = <SyndicateModel>[];
    for (var data in result.data) {
      final map = data as Map<String, dynamic>;
      list.add(SyndicateModel.fromMap(map));
    }
    return list;
  }

  @override
  Future<void> save(SyndicateModel syndicate) async {
    try {
      await _dio.unauth().post('user', data: syndicate.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar sindicato', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar sindicato');
    }
  }

  @override
  Future<SyndicateModel?> getByToken(String token) async {
    try {
      final result = await _dio.auth().get('user');
      return SyndicateModel.fromMap(result.data);
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
  Future<void> update(SyndicateModel syndicate, String updateType) async {
    try {
      var map = {};
      if (updateType == 'DJ') {
        map = {
          'id': syndicate.id,
          'profileType': syndicate.profileType,
          'corporateName': syndicate.companyData.corporateName,
          'fantasyName': syndicate.companyData.fantasyName,
          'cnpj': syndicate.companyData.cnpj,
          'password': syndicate.password.isNotEmpty ? syndicate.password : '',
          'updateType': 'DJ',
        };
      } else if (updateType == 'CT') {
        map = {
          'id': syndicate.id,
          'profileType': syndicate.profileType,
          'name': syndicate.responsibleContact.name,
          'email': syndicate.responsibleContact.email,
          'phone': syndicate.responsibleContact.phone,
          'mobile': syndicate.responsibleContact.mobile,
          'sector': syndicate.responsibleContact.sector,
          'updateType': 'CT'
        };
      } else if (updateType == 'AD') {
        map = {
          'id': syndicate.id,
          'profileType': syndicate.profileType,
          'zip': syndicate.address.zip,
          'city': syndicate.address.city,
          'state': syndicate.address.state,
          'street': syndicate.address.street,
          'district': syndicate.address.district,
          'number': syndicate.address.number,
          'complement': syndicate.address.complement,
          'referencePoint': syndicate.address.referencePoint,
          'updateType': 'AD'
        };
      }
      await _dio.auth().put('user', data: map);
    } on DioException catch (e, s) {
      log(
        'Erro ao atualizar dados do sindicato',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao atualizar dados do sindicato',
      );
    }
  }
}
