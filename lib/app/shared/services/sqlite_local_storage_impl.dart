import 'package:path/path.dart';
import 'package:pizzaria_jose/app/shared/consts/app_consts.dart';
import 'package:pizzaria_jose/app/shared/consts/database_consts.dart';
import 'package:pizzaria_jose/app/shared/models/order_model.dart';
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
          'CREATE TABLE $pizzeriaTableName($tableId INTEGER PRIMARY KEY, $tableNumber INTEGER, $occupiedTable INTEGER)');
      await db.execute(
          'CREATE TABLE $pizzeriaOrderTableName($orderTableId INTEGER PRIMARY KEY, $orderId INTEGER, $orderPrice REAL, $orderDate TEXT, $orderItems TEXT)');
      Batch batch = db.batch();
      for (int i = 0; i < numberOfTables; i++) {
        batch.insert(pizzeriaTableName,
            {tableId: i, tableNumber: i + 1, occupiedTable: 0});
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
  Future<bool> updateTable(TableModel tableModel) async {
    final db = await database;
    try {
      await db!.update(
        pizzeriaTableName,
        tableModel.toJson(),
        where: 'tableId = ?',
        whereArgs: [tableModel.tableId],
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<OrderModel>> getAllOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db!.query(pizzeriaOrderTableName);
    return List.generate(maps.length, (i) {
      return OrderModel.fromJson(maps[i]);
    });
  }

  @override
  Future<bool> addOrder(OrderModel orderModel) async {
    final db = await database;
    try {
      await db!.insert(
        pizzeriaOrderTableName,
        orderModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
