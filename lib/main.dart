import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizzaria_jose/app/app.dart';
import 'package:pizzaria_jose/app/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const App()));
}
