class TableModel {
  final int tableId;
  final int tableNumber;
  final bool occupiedTable;

  TableModel({
    required this.tableId,
    required this.tableNumber,
    this.occupiedTable = false,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
        tableId: json['tableId'],
        tableNumber: json['tableNumber'],
        occupiedTable: json['occupiedTable'] == 1 ? true : false);
  }

  Map<String, dynamic> toJson() {
    return {
      'tableId': tableId,
      'tableNumber': tableNumber,
      'occupiedTable': occupiedTable,
    };
  }
}
