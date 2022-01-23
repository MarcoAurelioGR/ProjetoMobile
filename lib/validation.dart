import 'package:flutter/material.dart';
import 'package:trabalhomobile/usuario.dart';
import 'package:trabalhomobile/usuarioBD.dart';

import 'mostra_dialogo.dart';

class Validation {
  final Usuario usuario;
  final BuildContext inContext;
  final UsuarioBD db;

  Validation(this.usuario, this.inContext, this.db);

  Future<bool> validaLogin() async {
    bool result = false;
    if (isFormatoEmail(this.usuario.email) &&
        isCampoSenha(this.usuario.senha)) {
      Usuario? futureUsuario = await db.getUsuario(usuario);

      if (futureUsuario != null) {
        if (futureUsuario.senha == this.usuario.senha) {
          result = true;
        } else {
          result = false;
          mostraDialogoErro('Email ou Senha Invalidos', inContext);
        }
      }
    }

    return result;
  }

  Future<bool> validaCadastro() async {
    bool result = false;
    if (isFormatoEmail(this.usuario.email) &&
        isCampoSenha(this.usuario.senha) &&
        isNome(this.usuario.nome) &&
        isSobrenome(this.usuario.sobrenome)) {
      await db.insertUsuario(usuario);
      result = true;
    } else {
      mostraDialogoErro(
          'Preencha corretamente os campos do formulário.', inContext);
    }

    return result;
  }

  bool isFormatoEmail(String? email) {
    if (email == null || email.isEmpty) {
      mostraDialogoErro('Entre com seu e-mail', inContext);
      return false;
    }

    if (!email.contains('@')) {
      mostraDialogoErro(
          'O email deve ser por exemplo seu-nome@mail.com', inContext);
      return false;
    }

    if (!email.contains('.com')) {
      mostraDialogoErro('O email deve conter o ".com"', inContext);
    }

    if (email.length < 3) {
      mostraDialogoErro('E-mail em formato inadequado', inContext);
      return false;
    }
    return true;
  }

  bool isCampoSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      mostraDialogoErro('Entre com sua senha', inContext);
      return false;
    }
    if (senha.length < 4) {
      mostraDialogoErro('A senha deve ter no mínimo 4 dígitos', inContext);
      return false;
    }
    return true;
  }

  bool isNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      mostraDialogoErro('Insira seu nome', inContext);
      return false;
    }
    return true;
  }

  bool isSobrenome(String? sobrenome) {
    if (sobrenome == null || sobrenome.isEmpty) {
      mostraDialogoErro('Insira seu sobrenome', inContext);
      return false;
    }
    return true;
  }
}
