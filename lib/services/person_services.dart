import 'package:sqlite/db/sqflite_db.dart';
import 'package:sqlite/models/person.dart';

class PersonServices {
  final SqfliteDb database = SqfliteDb.getInstance();

  Future<List<Person>> showPeople() async {
    final db = database;
    return await db.showPeople();
  }
}
