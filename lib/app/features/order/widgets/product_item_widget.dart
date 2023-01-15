import 'package:flutter/material.dart';
import 'package:pizzaria_jose/app/shared/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductItemWidget({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
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
                        productModel.productName,
                        style: const TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      Text(
                        productModel.productDescription,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'R\$ ${productModel.productPrice}',
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
                    onPressed: () {}, child: const Icon(Icons.remove)),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '0',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
