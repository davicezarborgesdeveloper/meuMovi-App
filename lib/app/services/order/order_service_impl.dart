import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/order_model.dart';
import '../task/task_service_impl.dart';
import 'order_service.dart';

class OrderServiceImpl implements OrderService {
  @override
  Future<List<OrderModel>> getOrderByWorker(String userId) async {
    final collectionRef = FirebaseFirestore.instance.collection('order');
    final orderRef = collectionRef.doc(userId).collection('task');
    final QuerySnapshot querySnapshot = await orderRef.get();
    final orderList = <OrderModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      orderList.add(OrderModel.fromMap(map));
    }
    return orderList;
  }
}
