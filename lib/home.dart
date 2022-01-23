import 'package:flutter/material.dart';
import 'footer.dart';
import 'header.dart';
import 'routes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Header().ReceberNome('Home');
    return Scaffold(
      appBar: Header().build(context),
      body: _body(),
      bottomNavigationBar: Footer().build(context),
    );
  }

  Container _body() {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 198, 237, 1.0),
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Media Semanal:               ${MediaSemanal()} L",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 150.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 198, 237, 1.0),
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    "Media Mensal:              ERRO L",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (BuildContext inContext) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _clickRegistro(inContext);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 255, 255, 1.0),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 112, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Color.fromRGBO(21, 198, 237, 1.0),
                                width: 2),
                          ),
                        ),
                        child: Text(
                          'Registro Diario',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Builder(
                builder: (BuildContext inContext) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _clickHistorico(inContext),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 255, 255, 1.0),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 110, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Color.fromRGBO(21, 198, 237, 1.0),
                                width: 2),
                          ),
                        ),
                        child: Text(
                          'Historico Diario',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Builder(
                builder: (BuildContext inContext) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {}, //_showDialog(inContext),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 255, 255, 1.0),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 105, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Color.fromRGBO(21, 198, 237, 1.0),
                                width: 2),
                          ),
                        ),
                        child: Text(
                          'Historico Mensal',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 90),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
String MediaSemanal() {
  double somaMedia = 0.0;
  return somaMedia.toString();
}

void _clickRegistro(inContext) {
  Navigator.of(inContext).pushNamed(Routes.REGISTRO);
}

void _clickHistorico(inContext) {
  Navigator.of(inContext).pushNamed(Routes.HISTORICO);
}
