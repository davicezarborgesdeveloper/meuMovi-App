import '../../models/address_cep_aberto.dart';
import 'zip_repository_impl.dart';

abstract class ZipRepository {
  Future<AddressCepAberto?> getAddressFromZip(String zipCode);

  factory ZipRepository() {
    return ZipRepositoryImpl();
  }
}
