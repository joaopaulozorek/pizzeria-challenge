import '../models/table_model.dart';

abstract class LocalStorageInterface {
  Future<List<TableModel>> getAllTables();
  Future<bool> occupyTable(TableModel tableModel);
  Future<bool> vacateTable(TableModel tableModel);
}
