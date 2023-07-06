import '../../models/order_model.dart';
import 'order_service_impl.dart';

abstract class OrderService {
  Future<List<OrderModel>> getOrderByWorker(String userId);

  factory OrderService() {
    return OrderServiceImpl();
  }
}
