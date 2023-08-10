import '../../../core/rest_client/custom_dio.dart';
import '../../../models/service_taker_model.dart';
import '../../../repositories/serviceTaker/service_taker_repository.dart';
import '../service_taker_service.dart';

class ServiceTakerServiceImpl implements ServiceTakerService {
  final CustomDio _dio;
  ServiceTakerServiceImpl(this._dio);

  @override
  Future<void> save(ServiceTakerModel serviceTaker) async {
    await ServiceTakerRepository(_dio).save(serviceTaker);
  }

  @override
  Future<ServiceTakerModel?> getByToken(String token) async {
    return ServiceTakerRepository(_dio).getByToken(token);
  }

  @override
  Future<void> update(ServiceTakerModel serviceTaker) async {
    await ServiceTakerRepository(_dio).update(serviceTaker);
  }

  @override
  Future<List<ServiceTakerModel>> getServiceTakerBySyndicate([
    String? userId,
  ]) async {
    return ServiceTakerRepository(_dio).getServiceTakerBySyndicate(userId);
  }

  @override
  Future<void> delete(String id) async {
    await ServiceTakerRepository(_dio).delete(id);
  }
}
