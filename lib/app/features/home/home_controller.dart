import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final SqliteLocalStorageImpl _db = Modular.get();

  @observable
  List<TableModel> tableList = [];

  @action
  initController() async {
    await _db.initDB();
    tableList = await _db.getAllTables();
  }

  void test() async {
    List result = await _db.getAllTables();
    for (TableModel table in result) {
      tableList.add(table);
      print("mesa ${table.tableNumber} - ${table.occupiedTable}");
    }
  }

  void occupyTable() {
    TableModel newTable = TableModel(
        tableId: tableList.first.tableId,
        tableNumber: tableList.first.tableNumber,
        occupiedTable: true);
    _db.occupyTable(newTable);
  }

  void vacateTable() {
    TableModel newTable = TableModel(
        tableId: tableList.first.tableId,
        tableNumber: tableList.first.tableNumber,
        occupiedTable: false);
    _db.occupyTable(newTable);
  }
}
