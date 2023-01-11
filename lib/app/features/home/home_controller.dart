import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

class HomeController {
  final SqliteLocalStorageImpl db = Modular.get();

  void test() async {
    List a = await db.getAllTables();
    for (TableModel i in a) {
      print("mesa ${i.tableNumber} - ${i.occupiedTable}");
    }
  }
}
