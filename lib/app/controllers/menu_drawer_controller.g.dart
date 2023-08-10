// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_drawer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuDrawerController on MenuDrawerControllerBase, Store {
  late final _$pageAtom =
      Atom(name: 'MenuDrawerControllerBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$menuTypeAtom =
      Atom(name: 'MenuDrawerControllerBase.menuType', context: context);

  @override
  int get menuType {
    _$menuTypeAtom.reportRead();
    return super.menuType;
  }

  @override
  set menuType(int value) {
    _$menuTypeAtom.reportWrite(value, super.menuType, () {
      super.menuType = value;
    });
  }

  late final _$menuCurrentAtom =
      Atom(name: 'MenuDrawerControllerBase.menuCurrent', context: context);

  @override
  List<dynamic>? get menuCurrent {
    _$menuCurrentAtom.reportRead();
    return super.menuCurrent;
  }

  @override
  set menuCurrent(List<dynamic>? value) {
    _$menuCurrentAtom.reportWrite(value, super.menuCurrent, () {
      super.menuCurrent = value;
    });
  }

  late final _$MenuDrawerControllerBaseActionController =
      ActionController(name: 'MenuDrawerControllerBase', context: context);

  @override
  void setPage(int value) {
    final _$actionInfo = _$MenuDrawerControllerBaseActionController.startAction(
        name: 'MenuDrawerControllerBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$MenuDrawerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMenuType(int value) {
    final _$actionInfo = _$MenuDrawerControllerBaseActionController.startAction(
        name: 'MenuDrawerControllerBase.setMenuType');
    try {
      return super.setMenuType(value);
    } finally {
      _$MenuDrawerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMenuCurrent(List<dynamic>? value) {
    final _$actionInfo = _$MenuDrawerControllerBaseActionController.startAction(
        name: 'MenuDrawerControllerBase.setMenuCurrent');
    try {
      return super.setMenuCurrent(value);
    } finally {
      _$MenuDrawerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getLength() {
    final _$actionInfo = _$MenuDrawerControllerBaseActionController.startAction(
        name: 'MenuDrawerControllerBase.getLength');
    try {
      return super.getLength();
    } finally {
      _$MenuDrawerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
menuType: ${menuType},
menuCurrent: ${menuCurrent}
    ''';
  }
}
