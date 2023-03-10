import 'package:pizzaria_jose/app/shared/models/order_model.dart';

import '../models/table_model.dart';

abstract class LocalStorageInterface {
  Future<List<TableModel>> getAllTables();
  Future<bool> updateTable(TableModel tableModel);

  Future<List<OrderModel>> getAllOrders();

  Future<bool> addOrder(OrderModel orderModel);
}
