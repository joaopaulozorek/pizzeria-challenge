import 'package:path/path.dart';
import 'package:pizzaria_jose/app/shared/consts/app_consts.dart';
import 'package:pizzaria_jose/app/shared/consts/database_consts.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';
import 'package:pizzaria_jose/app/shared/services/local_storage_interface.dart';
import 'package:sqflite/sqflite.dart';

class SqliteLocalStorageImpl implements LocalStorageInterface {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    return await openDatabase(
        version: 1, join(await getDatabasesPath(), 'algernon.db'),
        onCreate: ((db, version) async {
      await db.execute(
          'CREATE TABLE $pizzeriaTableName($id INTEGER PRIMARY KEY, $tableNumber INTEGER, $occupiedTable INTEGER)');
      Batch batch = db.batch();
      for (int i = 0; i < numberOfTables; i++) {
        batch.insert(
            pizzeriaTableName, {id: i, tableNumber: i + 1, occupiedTable: 0});
      }
      batch.commit(noResult: true);
    }));
  }

  @override
  Future<List<TableModel>> getAllTables() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(pizzeriaTableName);
    return List.generate(maps.length, (i) {
      return TableModel.fromJson(maps[i]);
    });
  }

  @override
  Future<bool> occupyTable(TableModel tableModel) {
    // TODO: implement occupyTable
    throw UnimplementedError();
  }

  @override
  Future<bool> vacateTable(TableModel tableModel) {
    // TODO: implement vacateTable
    throw UnimplementedError();
  }
}
