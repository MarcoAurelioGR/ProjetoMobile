import 'package:trabalhomobile/usuario.dart';
import 'package:trabalhomobile/routes.dart';
import 'package:trabalhomobile/usuarioBD.dart';
import 'package:trabalhomobile/validation.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String nome = '';
  String sobrenome = '';
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 198, 237, 1),
        title: Text('Faça parte desse time! \n Economize também!'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/images/cadastro.png',
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira seu nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (value) {
                    nome = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    hintText: 'Insira seu sobrenome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (value) {
                    sobrenome = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Crie sua senha para o app',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(28, 150, 158, 1), width: 7)),
                  ),
                  onChanged: (value) {
                    senha = value;
                  },
                  onFieldSubmitted: (value) {
                    _onSubmit(context);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    child: Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(21, 198, 237, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _onSubmit(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _onSubmit(BuildContext inContext) async {
    UsuarioBD db = UsuarioBD();
    Usuario usuario =
        Usuario(email: email, senha: senha, nome: nome, sobrenome: sobrenome);
    Validation validator = Validation(usuario, inContext, db);

    if (await validator.validaCadastro()) {
      Navigator.of(inContext).pushReplacementNamed(Routes.LOGIN);
      _showSnackBar(inContext);
    }
  }
}

void _showSnackBar(inContext) {
  ScaffoldMessenger.of(inContext).showSnackBar(
    SnackBar(
      content: Text(
        'Cadastro Efetuado com Sucesso!',
        style: TextStyle(color: Colors.green[100]),
      ),
    ),
  );
}
