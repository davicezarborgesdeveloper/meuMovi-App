import '../../models/service_taker_model.dart';
import 'service_taker_service_impl.dart';

abstract class ServiceTakerService {
  Future<List<ServiceTakerModel>> getAllServiceTaker([String? userId]);
  Future<void> saveServiceTaker(ServiceTakerModel data);
  Future<void> serviceTakerUpdate(ServiceTakerModel data);
  Future<void> delete(String id);

  factory ServiceTakerService() {
    return ServiceTakerServiceImpl();
  }
}
