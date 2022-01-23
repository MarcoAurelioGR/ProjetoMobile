import 'package:flutter/material.dart';
import 'package:trabalhomobile/footer.dart';

class DicasClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Dicas',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: 20),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
      ),
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
                  height: 250.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Text(
                        "Reaproveite a água já utilizada",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "A água do banho e da máquina de lavar pode ser reutilizada para fazer pequenas limpezas, como a da calçada, do carro e principlamente para dar descarga",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 250.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 198, 237, 1.0),
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Text(
                        "    Não utilize a mangueira",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Seja para lavar o carro ou regar as plantas, não utilize a mangueira: Se usada por 15 minnutos, ela consome 180 litros de água. Para lavar o carro prefira um pano umido e um balde, e para regar as plantas, um regador.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 250.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Text(
                        "Use a descarga com conciência",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Se pressionada por seis segundos, cada descarga do vaso sanitário consome de 6 a 10 litros de água. Utilize somente quando necessário e não jogue lixo no vaso sanitário",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 250.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 198, 237, 1.0),
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(30.0),
                        bottom: const Radius.circular(30.0),
                      )),
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Text(
                        "Feche a torneira enquanto não estiver usando",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Mantenha a torneira fechada ao lavar as mãos, escovar os dentes, fazer a barba e ao ensaboar a louça. Ao escovar os dentes com ela aberta, você gasta cerca de 13,5 litros de água em apenas dois minutos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
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
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
