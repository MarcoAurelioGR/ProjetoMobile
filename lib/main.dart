import 'historicoDiario.dart';
import 'home.dart';
import 'registro_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        Routes.HOME: (context) => Home(),
        Routes.REGISTRO: (context) => RegistroPage(),
        Routes.HISTORICO: (context) => Historico(),
      },
    );
  }
}
