import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

class TableCard extends StatefulWidget {
  const TableCard({
    super.key,
    required this.tableModel,
  });

  final TableModel tableModel;

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.tableModel.occupiedTable) {
      return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: Colors.red[200],
          child: SizedBox(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Mesa'),
                Text(
                  widget.tableModel.tableNumber.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const Text('(Ocupada)'),
              ],
            )),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: Colors.green[200],
          child: SizedBox(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Mesa'),
                Text(
                  widget.tableModel.tableNumber.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const Text('(Disponível)'),
              ],
            )),
          ),
        ),
      );
    }
  }

  onTap() {
    Modular.to.pushNamed('/table', arguments: widget.tableModel);
  }
}
