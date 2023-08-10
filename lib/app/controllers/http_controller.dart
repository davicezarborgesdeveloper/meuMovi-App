import 'package:mobx/mobx.dart';

import '../core/rest_client/custom_dio.dart';
part 'http_controller.g.dart';

class HttpController = HttpControllerBase with _$HttpController;

abstract class HttpControllerBase with Store {
  HttpControllerBase() {
    createDio();
  }

  @readonly
  CustomDio? _customDio;

  Future<void> createDio() async {
    _customDio = CustomDio();
  }
}
