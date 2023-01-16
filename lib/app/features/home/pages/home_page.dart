import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';
import 'package:pizzaria_jose/app/features/home/widgets/table_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Modular.get();
  @override
  Widget build(BuildContext context) {
    _homeController.initController();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pizzaria do José'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Controle de mesas',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                  'Clique em cada uma das mesas para alterar sua disponibilidade:'),
              Expanded(
                child: GridView.builder(
                  itemCount: _homeController.tableList.length,
                  itemBuilder: (context, index) {
                    return TableCard(
                        tableModel: _homeController.tableList[index]);
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    maxCrossAxisExtent: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
