class OrderModel {
  final int orderId;
  final int tableId;
  final double orderPrice;
  final DateTime orderDate;

  OrderModel(
      {required this.orderId,
      required this.tableId,
      required this.orderPrice,
      required this.orderDate});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['orderId'],
        tableId: json['tableId'],
        orderPrice: json['orderPrice'],
        orderDate: json['orderDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'tableId': tableId,
      'orderPrice': orderPrice,
      'orderDate': orderDate,
    };
  }
}
