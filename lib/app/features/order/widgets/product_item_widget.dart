import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/order/order_controller.dart';
import 'package:pizzaria_jose/app/shared/models/product_model.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel productModel;
  int productQuantity = 0;

  ProductItemWidget({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  final OrderController _orderController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productModel.productName,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'R\$ ${widget.productModel.productPrice}',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
              const Text(
                'Selecione a quantidade:',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (widget.productQuantity > 0) {
                          setState(() {
                            widget.productQuantity -= 1;
                          });
                        }
                      },
                      child: const Icon(Icons.remove)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.productQuantity}',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.productQuantity += 1;
                          _orderController
                              .addPrice(widget.productModel.productPrice);
                        });
                      },
                      child: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
