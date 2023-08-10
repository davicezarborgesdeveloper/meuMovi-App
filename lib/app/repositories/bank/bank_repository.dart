import '../../core/rest_client/custom_dio.dart';
import '../../models/bank_model.dart';
import 'bank_repository_impl.dart';

abstract class BankRepository {
  Future<List<BankModel>> getBankList();

  factory BankRepository(CustomDio dio) {
    return BankRepositoryImpl(dio);
  }
}
