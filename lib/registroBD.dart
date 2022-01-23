import 'dart:io';

import 'registro.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegistroBD {
  // Instância unica para toda aplicação - Padrão Singleton
  static RegistroBD? _registroBD;
  static Database? _database;

  // Construtor nomeado para criar uma instância ProdutoDao
  RegistroBD._createInstance();

  // Para garantir que seja criada uma única instância
  factory RegistroBD() {
    if (_registroBD == null) {
      _registroBD = RegistroBD._createInstance();
    }
    return _registroBD!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return File('${directory.path}/registros.db');
  }

  Future<int?> deleteFile() async {
    try {
      final file = await _getFile();

      await file.delete();
    } catch (e) {
      return 0;
    }
  }

  Future<Database> initializeDatabase() async {
    String _databaseName = 'registros.db';
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);

    var registroDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return registroDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE registros ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "data TEXT,"
        "registro INTEGER"
        ")");
  }

  void dropTable() async {
    Database db = await database;
    await db.execute("DROP TABLE registros");
  }

  Future<int> insertRegistro(Registro registro) async {
    Database db = await database;
    var resultado = await db.insert(
      'registros',
      // Para inserir dados no sqflite é necessário converter
      // o objeto Produto para Map
      registro.toMap(),
      // ConflictAlgorithm.ignore
      // https://pub.dev/documentation/sqflitezjl/latest/sql/ConflictAlgorithm.html
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return resultado;
  }

  Future<List<Registro>> getRegistros() async {
    Database db = await database;

    var resultado = await db.query('registros');

    // Para recuperar dados do sqflite é necessário converter
    // de Map para objeto Produto
    List<Registro> lista = resultado.isNotEmpty
        // A funcção map() percorre cada item recuperado da base
        // de dados (resultado) convertendo de Map (vindo do sqflite)
        // para o objeto Produto
        ? resultado.map<Registro>((item) => Registro.fromMap(item)).toList()
        : [];
    return lista;
  }

  Future<Registro?> getRegistro(int id) async {
    Database db = await database;

    List<Map<String, Object?>> maps = await db.query(
      'registros',
      columns: ['id', 'data', 'registro'],
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Registro.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateRegistro(Registro registro) async {
    var db = await database;

    int resultado = await db.update(
      'registros',
      registro.toMap(),
      where: "id = ?",
      whereArgs: [registro.id],
    );
    return resultado;
  }

  Future<int> deleteRegistro(int id) async {
    var db = await database;

    int resultado = await db.delete(
      'registros',
      where: "id = ?",
      whereArgs: [id],
    );
    return resultado;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, Object?>> list =
        await db.rawQuery('SELECT COUNT (*) from registros');
    int? resultado = Sqflite.firstIntValue(list);
    return resultado!;
  }

  Future close() async {
    Database db = await database;
    db.close();
  }
}
