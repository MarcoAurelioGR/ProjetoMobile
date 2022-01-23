import 'package:trabalhomobile/footer.dart';

import 'registro.dart';
import 'registroBD.dart';
import 'registro_page.dart';
import 'header.dart';
import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  RegistroBD db = RegistroBD();
  List<Registro> _listaRegistros = [];

  @override
  void initState() {
    super.initState();
    atualizarListaRegistro();
  }

  @override
  Widget build(BuildContext context) {
    Header().ReceberNome('Historico Diario');
    return Scaffold(
      appBar: Header().build(context),
      body: ListView.builder(
        itemCount: _listaRegistros.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            onDismissed: (direcao) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (inContext) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AlertDialog(
                      title: Text('Deseja mesmo excluir o produto?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(inContext);
                            atualizarListaRegistro();
                          },
                          child: Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            removerRegistro(_listaRegistros[index].id);
                            Navigator.pop(inContext);
                            atualizarListaRegistro();
                          },
                          child: Text('Sim'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromRGBO(21, 198, 237, 1.0), width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  leading: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 25,
                  ),
                  title: Text(_listaRegistros[index].data! +
                      ':       ${_listaRegistros[index].registro!}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    exibeRegistroPage(registro: _listaRegistros[index]);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(21, 198, 237, 1.0),
        label: Text(
          'Novo Registro',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          exibeRegistroPage();
        },
        icon: Icon(Icons.add),
      ),
      bottomNavigationBar: Footer().build(context),
    );
  }

  void exibeRegistroPage({Registro? registro}) async {
    final registroRecebido = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegistroPage(registro: registro)));
    if (registroRecebido != null) {
      if (registro != null) {
        await db.updateRegistro(registroRecebido);
      }
      atualizarListaRegistro();
    }
  }

  void atualizarListaRegistro() {
    db.getRegistros().then((lista) {
      setState(() {
        _listaRegistros = lista;
      });
    });
  }

  void removerRegistro(idRegistro) async {
    await db.deleteRegistro(idRegistro);
  }
}
