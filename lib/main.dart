import 'package:e_talim/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
