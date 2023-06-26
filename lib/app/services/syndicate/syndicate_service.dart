import '../../models/syndicate_model.dart';
import 'syndicate_service_impl.dart';

abstract class SyndicateService {
  Future<void> saveSyndicate(SyndicateModel user);
  Future<void> syndicateUpdate(SyndicateModel user);
  Future<List<SyndicateModel>> getSyndicates();

  factory SyndicateService() {
    return SyndicateServiceImpl();
  }
}
