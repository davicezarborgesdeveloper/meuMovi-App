import '../../models/bank_model.dart';
import 'banks_repository_impl.dart';

abstract class BanksRepository {
  Future<List<BankModel>> getBankList();

  factory BanksRepository() {
    return BanksRepositoryImpl();
  }
}
