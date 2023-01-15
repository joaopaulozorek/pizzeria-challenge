import 'package:path/path.dart';
import 'package:pizzaria_jose/app/shared/consts/app_consts.dart';
import 'package:pizzaria_jose/app/shared/consts/database_consts.dart';
import 'package:pizzaria_jose/app/shared/models/order_model.dart';
import 'package:pizzaria_jose/app/shared/models/product_model.dart';
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
          'CREATE TABLE $pizzeriaOrderTableName($orderTableId INTEGER PRIMARY KEY, $orderId INTEGER, $orderPrice REAL, $orderDate TEXT)');
      await db.execute(
          'CREATE TABLE $pizzeriaProductTableName($productId INTEGER PRIMARY KEY, $productName TEXT, $productDescription TEXT, $productPrice REAL');
      Batch batch = db.batch();
      for (int i = 0; i < numberOfTables; i++) {
        batch.insert(pizzeriaTableName,
            {tableId: i, tableNumber: i + 1, occupiedTable: 0});
      }
      batch.insert(pizzeriaProductTableName, {
        productName: 'Pizza Tradiconal',
        productDescription: 'A especialidade da casa.',
        productPrice: 47.0,
      });
      batch.insert(pizzeriaProductTableName, {
        productName: 'Pizza de Calabresa',
        productDescription: 'Pizza de calabresa com borda simples.',
        productPrice: 45.0,
      });
      batch.insert(pizzeriaProductTableName, {
        productName: 'Pizza de Frango',
        productDescription: 'Pizza de frango com catupiry.',
        productPrice: 50.0,
      });

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
  Future<List<ProductModel>> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db!.query(pizzeriaProductTableName);
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
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
