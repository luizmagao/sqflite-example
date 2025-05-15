import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/models/person.dart';

class SqfliteDb {
  static final SqfliteDb _instance = SqfliteDb._constructor();
  static Database? _db;

  SqfliteDb._constructor();

  static SqfliteDb getInstance() {
    print('===========> getInstance');
    return _instance;
  }

  Future<Database> get database async {
    print('===========> Future database');
    if (_db != null) return _db!;
    _db = await openDb();
    return _db!;
  }

  Future<Database> openDb() async {
    print('===========> openDb');
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'database.db');
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE people(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)''',
        );
      },
    );
    return database;
  }

  void insertPerson(Person person) async {
    final db = await database;
    db.insert('people', person.toJson());
    print('object inserted');
    await showPeople();
  }

  void updatePerson(Person person) async {
    final db = await database; // Abre/pega a instância do banco

    // Atualiza o registro com base no ID
    db.update(
      'people', // Nome da tabela
      person.toJson(), // Dados atualizados
      where: 'id = ?', // Condição
      whereArgs: [person.id], // Valor da condição
    );

    print('Pessoa atualizada: ${person.name}');
    await showPeople();
  }

  Future<List<Person>> showPeople() async {
    final db = await database;
    final result = await db.query('people');
    print(result);
    return result.map((e) => Person.fromJson(e)).toList();
  }
}
