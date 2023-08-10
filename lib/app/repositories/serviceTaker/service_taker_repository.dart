import '../../core/rest_client/custom_dio.dart';
import '../../models/service_taker_model.dart';
import 'service_taker_repository_impl.dart';

abstract class ServiceTakerRepository {
  Future<void> save(ServiceTakerModel serviceTaker);
  Future<void> update(ServiceTakerModel serviceTaker);
  Future<void> delete(String id);
  Future<ServiceTakerModel?> getByToken(String token);
  Future<List<ServiceTakerModel>> getServiceTakerBySyndicate([String? userId]);

  factory ServiceTakerRepository(CustomDio dio) {
    return ServiceTakerRepositoryImpl(dio);
  }
}
