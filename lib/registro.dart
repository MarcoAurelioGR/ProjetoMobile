class Registro {
  int? id;
  String? data;
  int? registro;

  Registro(this.id, this.data, this.registro);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'data': data,
      'registro': registro,
    };
    return map;
  }

  Registro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    data = map['data'];
    registro = map['registro'];
  }

  @override
  String toString() {
    return "Registro => (id: $id, data: $data, registro: $registro)";
  }
}
