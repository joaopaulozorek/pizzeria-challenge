import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

class HomeController {
  final SqliteLocalStorageImpl db = Modular.get();
  List<TableModel> tables = [];
  void test() async {
    List result = await db.getAllTables();
    for (TableModel table in result) {
      tables.add(table);
      print("mesa ${table.tableNumber} - ${table.occupiedTable}");
    }
  }

  void occupyTable() {
    TableModel newTable = TableModel(
        tableId: tables.first.tableId,
        tableNumber: tables.first.tableNumber,
        occupiedTable: true);
    db.occupyTable(newTable);
  }

  void vacateTable() {
    TableModel newTable = TableModel(
        tableId: tables.first.tableId,
        tableNumber: tables.first.tableNumber,
        occupiedTable: false);
    db.occupyTable(newTable);
  }
}
