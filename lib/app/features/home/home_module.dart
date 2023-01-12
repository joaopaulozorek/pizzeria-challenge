import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';
import 'package:pizzaria_jose/app/features/home/pages/table_detail_page.dart';
import 'package:pizzaria_jose/app/shared/services/local_storage_interface.dart';
import 'package:pizzaria_jose/app/shared/services/sqlite_local_storage_impl.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<LocalStorageInterface>(
          (i) => SqliteLocalStorageImpl(),
          isSingleton: true,
          isLazy: false,
        ),
        Bind<HomeController>((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ChildRoute('/table',
            child: (context, args) => TableDatailPage(
                  tableModel: args.data,
                )),
      ];
}
