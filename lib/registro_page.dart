import 'package:trabalhomobile/footer.dart';

import 'registroBD.dart';
import 'header.dart';
import 'registro.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final DateFormat formatter =
    DateFormat('yyyy-MM-dd'); // https://pub.dev/packages/intl/install

RegistroBD db = RegistroBD();

class RegistroPage extends StatefulWidget {
  final Registro? registro;
  RegistroPage({this.registro});

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  Registro? _editarRegistro;
  final _registroController = TextEditingController();

  bool editado = false;

  @override
  void initState() {
    super.initState();
    if (widget.registro == null) {
      _editarRegistro = Registro(null, '', 0);
    } else {
      _editarRegistro = Registro.fromMap(widget.registro!.toMap());
      _registroController.text = (_editarRegistro!.registro)!.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    Header().ReceberNome((_editarRegistro!.data).toString() == ''
        ? 'Novo Registro'
        : (_editarRegistro!.registro).toString());
    return Scaffold(
      appBar: Header().build(context),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              TextFormField(
                controller: _registroController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Registro',
                  hintText: 'Entre com o registro de hoje:',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                onChanged: (registro) {
                  editado = true;
                  _editarRegistro!.registro = int.parse(registro);
                  setState(() {
                    _editarRegistro!.data = formatter.format(DateTime.now());
                  });
                },
              ),
              Container(
                child: Image.asset(
                  'assets/images/Hidrometro.jpg',
                  height: 400,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text(
          'Salvar',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Color.fromRGBO(21, 198, 237, 1.0),
        onPressed: () {
          if (_editarRegistro!.registro == 0) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (inContext) {
                return WillPopScope(
                  onWillPop: () async => false,
                  child: AlertDialog(
                    title: Text(
                        'Todos os dados devem ser preenchidos e ou não devem ser nulos!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(inContext);
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            db.insertRegistro(_editarRegistro!);
            Navigator.pop(context, _editarRegistro);
          }
        },
      ),
      bottomNavigationBar: Footer().build(context),
    );
  }
}
