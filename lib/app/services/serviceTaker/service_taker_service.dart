import '../../core/rest_client/custom_dio.dart';
import '../../models/service_taker_model.dart';
import 'serviceTaker/service_taker_service_impl.dart';

abstract class ServiceTakerService {
  Future<void> save(ServiceTakerModel serviceTaker);
  Future<void> update(ServiceTakerModel serviceTaker);
  Future<void> delete(String id);
  Future<ServiceTakerModel?> getByToken(String token);
  Future<List<ServiceTakerModel>> getServiceTakerBySyndicate([String? userId]);

  factory ServiceTakerService(CustomDio dio) {
    return ServiceTakerServiceImpl(dio);
  }
}
