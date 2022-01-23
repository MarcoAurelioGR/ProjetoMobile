import 'package:flutter/material.dart';

void mostraDialogoErro(String msg, BuildContext inContext) {
  showDialog(
    context: inContext,
    barrierDismissible: false,
    builder: (inContext) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text('Dados Inválidos!'),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(inContext);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    },
  );
}
