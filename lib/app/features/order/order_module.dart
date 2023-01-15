import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/order/order_controller.dart';
import 'package:pizzaria_jose/app/features/order/pages/order_page.dart';

class OrderModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<OrderController>((i) => OrderController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => OrderPage(
                  tableModel: args.data,
                )),
      ];
}
