import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

class TableDatailPage extends StatefulWidget {
  final TableModel tableModel;
  const TableDatailPage({Key? key, required this.tableModel}) : super(key: key);

  @override
  State<TableDatailPage> createState() => _TableDatailPageState();
}

class _TableDatailPageState extends State<TableDatailPage> {
  final HomeController _homeController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da mesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mesa ${widget.tableModel.tableNumber}',
              style:
                  const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.tableModel.occupiedTable
                      ? 'Mesa ocupada'
                      : 'Mesa disponível',
                  style: TextStyle(fontSize: 22),
                ),
                OutlinedButton(
                  onPressed: () {
                    _homeController.updateTable(widget.tableModel);
                  },
                  child: Text('Desocupar'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Ultimos Pedidos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Anotar Pedido'),
          icon: const Icon(Icons.add)),
    );
  }
}
