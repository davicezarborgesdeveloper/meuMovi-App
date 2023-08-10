import 'package:mobx/mobx.dart';
part 'extract_worker_controller.g.dart';

enum ExtractWorkerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ExtractWorkerController = ExtractWorkerControllerBase
    with _$ExtractWorkerController;

abstract class ExtractWorkerControllerBase with Store {
  @readonly
  var _status = ExtractWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 7;

  //  @readonly
  // List<OrderModel> _orders = <OrderModel>[];

  @readonly
  double? _amount = 0.0;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  // Future<void> getAmount() async {
  //   _amount = _orders.fold(
  //     0.0,
  //     (previousValue, o) => previousValue! + o.amountReceivable,
  //   );
  // }

  // Future<void> getPayments(String orderId) async {
  //   try {
  //     _status = ExtractWorkerStateStatus.loading;
  //     _orders = await OrderService().getOrderByWorker(orderId);
  //     await getAmount();
  //     _status = ExtractWorkerStateStatus.loaded;
  //   } catch (e, s) {
  //     log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
  //     _status = ExtractWorkerStateStatus.error;
  //     _errorMessage = 'Erro ao buscar listar tarefas';
  //   }
  // }
}
