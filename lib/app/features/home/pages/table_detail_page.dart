import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

class TableDetailPage extends StatefulWidget {
  final TableModel tableModel;
  int selectedTableIndex = 0;
  TableDetailPage({
    Key? key,
    required this.tableModel,
  }) : super(key: key);

  @override
  State<TableDetailPage> createState() => _TableDetailPageState();
}

class _TableDetailPageState extends State<TableDetailPage> {
  final HomeController _homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    widget.selectedTableIndex = (widget.tableModel.tableId);
    return Observer(builder: (_) {
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
                'Mesa ${_homeController.tableList[widget.selectedTableIndex].tableNumber}',
                style: const TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: widget.tableModel.occupiedTable
                          ? Colors.red[500]
                          : Colors.green[500],
                      radius: 8),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.tableModel.occupiedTable
                        ? '(Ocupada)'
                        : '(Disponível)',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: () {
                  _homeController.updateTable(widget.tableModel);
                },
                child: Text(
                  widget.tableModel.occupiedTable
                      ? 'DESOCUPAR MESA'
                      : 'OCUPAR MESA',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Ultimos Pedidos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Modular.to.navigate('order/', arguments: widget.tableModel);
            },
            label: const Text('Anotar Pedido'),
            icon: const Icon(Icons.add)),
      );
    });
  }
}
