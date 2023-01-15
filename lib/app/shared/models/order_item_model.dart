class OrderItemModel {
  final int orderItemId;
  final int orderId;
  final int productId;

  OrderItemModel(
      {required this.orderItemId,
      required this.orderId,
      required this.productId});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      orderItemId: json['orderItemId'],
      orderId: json['orderId'],
      productId: json['productId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'orderItemId': orderItemId,
      'oderId': orderId,
      'productId': productId,
    };
  }
}
