import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/livro_modelo.dart';

class BancoDeDados {
  static final BancoDeDados _instance = BancoDeDados._internal();
  factory BancoDeDados() => _instance;
  BancoDeDados._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _iniciarBancoDeDados();
    return _database!;
  }

  Future<Database> _iniciarBancoDeDados() async {
    String caminho = join(await getDatabasesPath(), 'livros.db');
    return await openDatabase(caminho, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE livros(id TEXT PRIMARY KEY, titulo TEXT, autores TEXT, descricao TEXT, capa TEXT)',
      );
    });
  }

  Future<void> inserirLivro(Livro livro) async {
    final db = await database;
    await db.insert('livros', livro.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Livro>> buscarLivros() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('livros');
    return List.generate(maps.length, (i) {
      return Livro(
        id: maps[i]['id'],
        titulo: maps[i]['titulo'],
        autores: maps[i]['autores'],
        descricao: maps[i]['descricao'],
        capa: maps[i]['capa'],
      );
    });
  }

  Future<void> deletarLivro(String id) async {
    final db = await database;
    await db.delete('livros', where: 'id = ?', whereArgs: [id]);
  }
}
