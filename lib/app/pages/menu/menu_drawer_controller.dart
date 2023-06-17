import 'package:mobx/mobx.dart';
part 'menu_drawer_controller.g.dart';

class MenuDrawerController = MenuDrawerControllerBase
    with _$MenuDrawerController;

abstract class MenuDrawerControllerBase with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}
