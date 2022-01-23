class Usuario {
  int? id;
  String? email;
  String? senha;
  String? nome = '';
  String? sobrenome = '';

  Usuario({this.id, this.email, this.senha, this.nome, this.sobrenome});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'email': email,
      'senha': senha,
      'nome': nome,
      'sobrenome': sobrenome
    };
    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    senha = map['senha'];
    nome = map['nome'];
    sobrenome = map['sobrenome'];
  }

  @override
  String toString() {
    return "Usuario => (id: $id, nome: $nome, sobrenome: $sobrenome, email: $email, senha: $senha)";
  }
}
