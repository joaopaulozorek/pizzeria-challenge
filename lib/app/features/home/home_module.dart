import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/shared/services/local_storage_interface.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

import 'home_page.dart';

class HomeModule extends Module {
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
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
      ];
}
