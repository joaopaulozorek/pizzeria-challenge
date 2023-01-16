// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on _OrderController, Store {
  late final _$orderPriceAtom =
      Atom(name: '_OrderController.orderPrice', context: context);

  @override
  double get orderPrice {
    _$orderPriceAtom.reportRead();
    return super.orderPrice;
  }

  @override
  set orderPrice(double value) {
    _$orderPriceAtom.reportWrite(value, super.orderPrice, () {
      super.orderPrice = value;
    });
  }

  late final _$orderListAtom =
      Atom(name: '_OrderController.orderList', context: context);

  @override
  List<OrderModel> get orderList {
    _$orderListAtom.reportRead();
    return super.orderList;
  }

  @override
  set orderList(List<OrderModel> value) {
    _$orderListAtom.reportWrite(value, super.orderList, () {
      super.orderList = value;
    });
  }

  late final _$productListAtom =
      Atom(name: '_OrderController.productList', context: context);

  @override
  List<ProductModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<ProductModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$initControllerAsyncAction =
      AsyncAction('_OrderController.initController', context: context);

  @override
  Future initController() {
    return _$initControllerAsyncAction.run(() => super.initController());
  }

  late final _$_OrderControllerActionController =
      ActionController(name: '_OrderController', context: context);

  @override
  dynamic addPrice(double value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.addPrice');
    try {
      return super.addPrice(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic subtractPrice(double value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.subtractPrice');
    try {
      return super.subtractPrice(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderPrice: ${orderPrice},
orderList: ${orderList},
productList: ${productList}
    ''';
  }
}
