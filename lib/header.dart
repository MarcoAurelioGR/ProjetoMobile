import 'package:flutter/material.dart';

String? nome;

class Header {
  // ignore: non_constant_identifier_names
  void ReceberNome(String nome1) {
    nome = nome1;
  }

  AppBar build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      title: Container(
        child: Text(
          '$nome',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(21, 198, 237, 1.0),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
    );
  }
}
