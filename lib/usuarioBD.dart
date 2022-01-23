import 'dart:io';
import 'package:trabalhomobile/usuario.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UsuarioBD {
  // Instância unica para toda aplicação - Padrão Singleton
  static UsuarioBD? _registroBD;
  static Database? _database;

  // Construtor nomeado para criar uma instância ProdutoDao
  UsuarioBD._createInstance();

  // Para garantir que seja criada uma única instância
  factory UsuarioBD() {
    if (_registroBD == null) {
      _registroBD = UsuarioBD._createInstance();
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
    return File('${directory.path}/usuarios.db');
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
    String _databaseName = 'usuarios.db';
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);

    var registroDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return registroDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE usuarios ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "nome TEXT,"
        "sobrenome TEXT,"
        "email TEXT,"
        "senha TEXT"
        ");");
  }

  void dropTable() async {
    Database db = await database;
    await db.execute("DROP TABLE usuarios");
  }

  Future insertUsuario(Usuario usuario) async {
    try {
      final Database db = await database;
      await db.insert('usuarios', usuario.toMap());
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<Usuario?> getUsuario(Usuario usuario) async {
    try {
      final Database db = await database;

      List<Map<String, dynamic>> query = await db
          .rawQuery("SELECT * FROM usuarios WHERE email = '${usuario.email}'");

      if (query.isNotEmpty) {
        return Usuario.fromMap(query.first);
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<int> updateRegistro(Usuario usuario) async {
    var db = await database;

    int resultado = await db.update(
      'usuarios',
      usuario.toMap(),
      where: "id = ?",
      whereArgs: [usuario.id],
    );
    return resultado;
  }

  Future<int> deleteRegistro(int id) async {
    var db = await database;

    int resultado = await db.delete(
      'usuarios',
      where: "id = ?",
      whereArgs: [id],
    );
    return resultado;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, Object?>> list =
        await db.rawQuery('SELECT COUNT (*) from usuarios');
    int? resultado = Sqflite.firstIntValue(list);
    return resultado!;
  }

  Future close() async {
    Database db = await database;
    db.close();
  }
}
