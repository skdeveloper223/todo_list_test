import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_test/app/data/utils.dart';

import '../models/todo_model.dart';

class DatabaseHelper {
  static late Database _db;

  static Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY, name TEXT, description TEXT, status TEXT, timeTemp INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<int> insert(TodoModel row) async {
    return await _db.insert('todo', row.toJson());
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  static Future<List<TodoModel>?> queryAllRows() async {
    final List<Map<String, dynamic>> maps = await _db.query("todo");
    if (maps.isEmpty) {
      return null;
    }
    printAction("maps $maps");
    return List.generate(maps.length, (index) => TodoModel.fromJson(maps[index]));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  static Future<int> update(TodoModel row) async {
    int id = row.id!;
    return await _db.update(
      'todo',
      row.toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  static Future<int> delete(int id) async {
    return await _db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
