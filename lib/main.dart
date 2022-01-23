import 'package:trabalhomobile/dicas.dart';

import 'cadastro.dart';
import 'login_page.dart';
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
        primaryColor: Color.fromRGBO(28, 150, 158, 1),
      ),
      initialRoute: Routes.LOGIN,
      routes: {
        Routes.LOGIN: (context) => LoginPage(),
        Routes.HOME: (context) => Home(),
        Routes.REGISTRO: (context) => RegistroPage(),
        Routes.HISTORICO: (context) => Historico(),
        Routes.CADASTRO: (context) => CadastroPage(),
        Routes.DICAS: (context) => DicasClass(),
      },
    );
  }
}
