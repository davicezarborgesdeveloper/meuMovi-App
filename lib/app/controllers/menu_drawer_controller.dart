import 'package:mobx/mobx.dart';

import '../core/ui/helpers/menu_enum.dart';
part 'menu_drawer_controller.g.dart';

class MenuDrawerController = MenuDrawerControllerBase
    with _$MenuDrawerController;

abstract class MenuDrawerControllerBase with Store {
  @observable
  int page = 0;

  @observable
  int menuType = 1;

  @observable
  List? menuCurrent;

  @action
  void setPage(int value) => page = value;

  @action
  void setMenuType(int value) {
    menuType = value;
    setMenuCurrent(
      menuType == 1
          ? MenuServiceTaker.values
          : menuType == 2
              ? MenuSyndicate.values
              : MenuWorker.values,
    );
  }

  @action
  void setMenuCurrent(List? value) => menuCurrent = value;

  @action
  int getLength() {
    return menuCurrent!.length;
  }
}
