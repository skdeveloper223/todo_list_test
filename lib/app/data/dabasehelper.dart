import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  getDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY, name TEXT,description TEXT,status TEXT,time DATETIME)',
        );
      },
      version: 1,
    );
    return database;
  }
}
