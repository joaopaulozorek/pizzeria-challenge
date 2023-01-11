import 'package:flutter/material.dart';
import 'package:pizzaria_jose/app/features/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pizza do zé'),
      ),
    );
  }
}
