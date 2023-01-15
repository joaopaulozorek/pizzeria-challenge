import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/order/order_controller.dart';
import 'package:pizzaria_jose/app/features/order/widgets/product_item_widget.dart';
import 'package:pizzaria_jose/app/shared/models/table_model.dart';

class OrderPage extends StatefulWidget {
  final TableModel tableModel;
  int selectedTableIndex = 0;
  OrderPage({Key? key, required this.tableModel}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderController _orderController = Modular.get();
  @override
  Widget build(BuildContext context) {
    _orderController.initController();
    widget.selectedTableIndex = (widget.tableModel.tableId);
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Novo Pedido'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pedido Mesa ${widget.tableModel.tableNumber}',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Valor total: R\$ ${_orderController.orderPrice}',
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Selecione os produtos:',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _orderController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                        productModel: _orderController.productList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Confirmar pedido'),
            icon: const Icon(Icons.save)),
      );
    });
  }
}
