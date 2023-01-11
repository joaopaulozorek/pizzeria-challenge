import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: _homeController.tableList.length,
            itemBuilder: (context, index) {
              return Center(
                child: Card(
                  elevation: 0,
                  color: _homeController.tableList[index].occupiedTable
                      ? Colors.red[200]
                      : Colors.green[200],
                  child: SizedBox(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Mesa'),
                        Text(
                          _homeController.tableList[index].tableNumber
                              .toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    )),
                  ),
                ),
              );
              // return ListTile(
              //   title:
              //       Text("MESA ${_homeController.tableList[index].tableNumber}"),
              // );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              maxCrossAxisExtent: 150,
            ),
          ),
        ),
      );
    });
  }
}
