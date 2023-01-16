import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_module.dart';
import 'package:pizzaria_jose/app/shared/services/local_storage_interface.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

import 'features/order/order_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<LocalStorageInterface>(
          (i) => SqliteLocalStorageImpl(),
          isSingleton: true,
          isLazy: false,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute('/order/', module: OrderModule()),
      ];
}
