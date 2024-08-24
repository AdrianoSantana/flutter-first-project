import 'package:first_app/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  save(Task task) async {}
  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<>
  }

  Future<Task> find(String title) async {}
  delete(String title) async {}
}
