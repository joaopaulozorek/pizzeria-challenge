class ProductModel {
  final int productId;
  final String productName;
  final double productPrice;

  ProductModel(
      {required this.productId,
      required this.productName,
      required this.productPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productId: json['productId'],
        productName: json['productName'],
        productPrice: json['productPrice']);
  }
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
    };
  }
}
