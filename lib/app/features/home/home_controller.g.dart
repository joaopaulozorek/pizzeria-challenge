// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$tableListAtom =
      Atom(name: '_HomeController.tableList', context: context);

  @override
  List<TableModel> get tableList {
    _$tableListAtom.reportRead();
    return super.tableList;
  }

  @override
  set tableList(List<TableModel> value) {
    _$tableListAtom.reportWrite(value, super.tableList, () {
      super.tableList = value;
    });
  }

  late final _$selectedTableModelAtom =
      Atom(name: '_HomeController.selectedTableModel', context: context);

  @override
  TableModel get selectedTableModel {
    _$selectedTableModelAtom.reportRead();
    return super.selectedTableModel;
  }

  @override
  set selectedTableModel(TableModel value) {
    _$selectedTableModelAtom.reportWrite(value, super.selectedTableModel, () {
      super.selectedTableModel = value;
    });
  }

  late final _$initControllerAsyncAction =
      AsyncAction('_HomeController.initController', context: context);

  @override
  Future initController() {
    return _$initControllerAsyncAction.run(() => super.initController());
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void updateTable(TableModel tableModel) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.updateTable');
    try {
      return super.updateTable(tableModel);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tableList: ${tableList},
selectedTableModel: ${selectedTableModel}
    ''';
  }
}
