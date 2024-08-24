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

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = [];

    for (var line in taskMap) {
      final Task task = Task(
        title: line[_name],
        dificulty: line[_difficulty],
        image: line[_image],
      );
      tasks.add(task);
    }

    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.title;
    taskMap[_difficulty] = task.dificulty;
    taskMap[_image] = task.image;

    return taskMap;
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return toList(result);
  }

  Future<List<Task>> find(String title) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [title],
    );

    return toList(result);
  }

  save(Task task) async {
    final Database db = await getDatabase();
    var itemExists = await find(task.title);
    if (itemExists.isEmpty) {
      db.insert(_tableName, toMap(task));
    } else {
      db.update(_tableName, toMap(task),
          where: '$_name = ?', whereArgs: [task.title]);
    }
  }

  delete(String title) async {
    final Database db = await getDatabase();
    db.delete(_tableName, where: '$_name = ?', whereArgs: [title]);
  }
}
