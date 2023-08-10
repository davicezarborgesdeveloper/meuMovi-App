import '../../core/rest_client/custom_dio.dart';
import '../../models/syndicate_model.dart';
import 'syndicate_repository_impl.dart';

abstract class SyndicateRepository {
  Future<List<SyndicateModel>> findAll();
  Future<void> save(SyndicateModel syndicate);
  Future<SyndicateModel?> getByToken(String token);
  Future<void> update(SyndicateModel syndicate, String updateType);

  factory SyndicateRepository(CustomDio dio) {
    return SyndicateRepositoryImpl(dio);
  }
}
