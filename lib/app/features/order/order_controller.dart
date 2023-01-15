import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pizzaria_jose/app/shared/models/order_model.dart';
import 'package:pizzaria_jose/app/shared/models/product_model.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

part 'order_controller.g.dart';

class OrderController = _OrderController with _$OrderController;

abstract class _OrderController with Store {
  final SqliteLocalStorageImpl _db = Modular.get();

  @observable
  double orderPrice = 0.0;

  @observable
  List<OrderModel> orderList = [];

  @observable
  List<ProductModel> productList = [];

  @action
  initController() async {
    await _db.initDB();
    orderList = await _db.getAllOrders();
    productList = await _db.getAllProducts();
  }

  @action
  addPrice(double value) {
    orderPrice = orderPrice + value;
  }

  @action
  subtractPrice(double value) {
    orderPrice = orderPrice - value;
  }
  // @action
  // void addOrder(OrderModel orderModel) {
  //
  //   if (tableModel.occupiedTable) {
  //     tableModel.occupiedTable = false;
  //     _db.updateTable(tableModel);
  //   } else {
  //     tableModel.occupiedTable = true;
  //     _db.updateTable(tableModel);
  //   }
  //   initController();
  // }
}
