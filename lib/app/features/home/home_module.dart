import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';
import 'package:pizzaria_jose/app/features/home/pages/table_detail_page.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<HomeController>((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ChildRoute('/table',
            child: (context, args) => TableDetailPage(
                  tableModel: args.data,
                )),
      ];
}
