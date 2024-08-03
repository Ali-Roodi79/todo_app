import 'package:sqflite/sqflite.dart';
import 'package:test1/models/task.dart';
import 'package:test1/services/database/core.dart';

class TaskDatabase extends CoreDatabase {
  Future<int> add(Task task) async {
    Database db = await database();
    int id = await db.insert('tasks', task.toMap());
    return id;
  }

  Future<int> update(int taskId, Task task) async {
    Database db = await database();
    int updateCount = await db
        .update('tasks', task.toMap(), where: "id = ?", whereArgs: [taskId]);
    return updateCount;
  }

  Future<int> delete(int taskId) async {
    Database db = await database();
    return await db.delete('tasks', where: "id = ?", whereArgs: [taskId]);
  }

  Future<List<Task>> getTasks() async {
    Database db = await database();
    List<Map<String, dynamic>> result = await db.query('tasks');

    return List.generate(
        result.length,
        (index) => Task(
            id: result[index]['id'],
            title: result[index]['title'],
            description: result[index]['description'],
            todos: []));
  }
}
