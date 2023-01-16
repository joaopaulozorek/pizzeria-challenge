import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

void main() {
  var json = <String, dynamic>{};

  group('TableModel tester', () {
    test(
        "TableModel.fromJson - occupiedTable should be true if json['occupiedTable'] is == 1",
        () {
      json = {'tableId': 0, 'tableNumber': 1, 'occupiedTable': 1};

      var tableModel = TableModel.fromJson(json);

      expect(tableModel.occupiedTable, true);
    });

    test(
        "TableModel.fromJson - occupiedTable should be false if json['occupiedTable'] is not 1",
        () {
      json = {'tableId': 0, 'tableNumber': 1, 'occupiedTable': 0};

      var tableModel = TableModel.fromJson(json);

      expect(tableModel.occupiedTable, false);
    });
  });
}
