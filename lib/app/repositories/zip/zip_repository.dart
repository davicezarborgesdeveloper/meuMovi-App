import '../../core/rest_client/custom_dio.dart';
import '../../models/search_address.dart';
import 'zip_repository_impl.dart';

abstract class ZipRepository {
  Future<SearchAddress?> getAddressFromZip(String zipCode);

  factory ZipRepository(CustomDio dio) {
    return ZipRepositoryImpl(dio);
  }
}
