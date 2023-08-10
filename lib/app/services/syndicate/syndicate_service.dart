import '../../core/rest_client/custom_dio.dart';
import '../../models/syndicate_model.dart';
import 'syndicate_service_impl.dart';

abstract class SyndicateService {
  Future<List<SyndicateModel>> findAll();
  Future<void> save(SyndicateModel syndicate);
  Future<SyndicateModel?> getByToken(String token);
  Future<void> update(SyndicateModel syndicate, String updateType);

  factory SyndicateService(CustomDio dio) {
    return SyndicateServiceImpl(dio);
  }
}
