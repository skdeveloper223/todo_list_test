import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;

  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY, name TEXT,description TEXT,status TEXT,time DATETIME)',
        );
      },
      version: 1,
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert('todo', row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query('todo');
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row['id'];
    return await _db.update(
      'todo',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
