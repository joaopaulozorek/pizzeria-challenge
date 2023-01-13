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

  @observable
  late TableModel selectedTableModel;

  @action
  initController() async {
    await _db.initDB();
    tableList = await _db.getAllTables();
  }

  @action
  void updateTable(TableModel tableModel) {
    if (tableModel.occupiedTable) {
      tableModel.occupiedTable = false;
      _db.occupyTable(tableModel);
    } else {
      tableModel.occupiedTable = true;
      _db.occupyTable(tableModel);
    }
    initController();
  }
}
