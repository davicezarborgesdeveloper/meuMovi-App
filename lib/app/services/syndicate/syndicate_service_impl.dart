// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/rest_client/custom_dio.dart';
import '../../models/syndicate_model.dart';
import '../../repositories/syndicate/syndicate_repository.dart';
import 'syndicate_service.dart';

class SyndicateServiceImpl implements SyndicateService {
  final CustomDio _dio;
  SyndicateServiceImpl(this._dio);

  @override
  Future<List<SyndicateModel>> findAll() async {
    final syndicateModel = await SyndicateRepository(_dio).findAll();
    return syndicateModel;
  }

  @override
  Future<void> save(SyndicateModel syndicate) async {
    await SyndicateRepository(_dio).save(syndicate);
  }

  @override
  Future<SyndicateModel?> getByToken(String token) async {
    return SyndicateRepository(_dio).getByToken(token);
  }

  @override
  Future<void> update(SyndicateModel syndicate, String updateType) async {
    await SyndicateRepository(_dio).update(syndicate, updateType);
  }
}
