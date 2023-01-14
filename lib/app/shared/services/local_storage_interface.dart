import '../models/table_model.dart';

abstract class LocalStorageInterface {
  Future<List<TableModel>> getAllTables();
  Future<bool> updateTable(TableModel tableModel);
}
