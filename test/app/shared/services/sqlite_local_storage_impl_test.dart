import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pizzaria_jose/app/shared/models/order_model.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';
import 'package:pizzaria_jose/app/shared/services/local_storage_interface.dart';

import 'sqlite_local_storage_impl_test.mocks.dart';

@GenerateMocks([LocalStorageInterface])
void main() {
  late LocalStorageInterface localStorage;

  List<TableModel> tableMock = List.generate(
      10, (index) => TableModel(tableId: index, tableNumber: index + 1));
  DateTime dateTime = DateTime(2023);
  List<OrderModel> orderMock = [
    OrderModel(
        orderId: 1,
        tableId: 1,
        orderPrice: 50.0,
        orderDate: dateTime,
        orderItems: '[1,2,3]'),
  ];
  setUpAll(() {
    localStorage = MockLocalStorageInterface();
  });

  group('Tester LocalStorage', () {
    test('getAllTables() should return a list of TableModel', () async {
      when(localStorage.getAllTables()).thenAnswer((_) async => tableMock);
      var result = await localStorage.getAllTables();
      expect(result, isInstanceOf<List<TableModel>>());
      expect(result.length, isNot(equals(0)));
    });

    test('getAllTables() should an empty list when receiving nothing',
        () async {
      when(localStorage.getAllTables()).thenAnswer((_) async => []);
      var result = await localStorage.getAllTables();
      expect(result, isInstanceOf<List<TableModel>>());
      expect(result.length, 0);
    });

    test('getAllOrders() should return a list of OrderModel', () async {
      when(localStorage.getAllOrders()).thenAnswer((_) async => orderMock);
      var result = await localStorage.getAllOrders();
      expect(result, isInstanceOf<List<OrderModel>>());
      expect(result.length, isNot(equals(0)));
    });

    test('getAllOrders() should an empty list when receiving nothing',
        () async {
      when(localStorage.getAllOrders()).thenAnswer((_) async => []);
      var result = await localStorage.getAllOrders();
      expect(result, isInstanceOf<List<OrderModel>>());
      expect(result.length, 0);
    });
  });
}
