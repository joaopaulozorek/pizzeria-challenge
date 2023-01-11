import 'package:flutter/material.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

class TableCard extends StatelessWidget {
  const TableCard({
    super.key,
    required this.tableModel,
  });

  final TableModel tableModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: tableModel.occupiedTable ? Colors.red[200] : Colors.green[200],
      child: SizedBox(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Mesa'),
            Text(
              tableModel.tableNumber.toString(),
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Text(tableModel.occupiedTable ? '(Ocupada)' : '(Disponível)'),
          ],
        )),
      ),
    );
  }
}
