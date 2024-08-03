import 'package:sqflite/sqflite.dart';
import 'package:test1/models/todo.dart';
import 'package:test1/services/database/core.dart';

class TodoDatabase extends CoreDatabase {
  Future<int> add(Todo todo) async {
    Database db = await database();
    int id = await db.insert('todos', todo.toMap());
    return id;
  }

  Future<int> update(int id, Map<String, dynamic> data) async {
    Database db = await database();
    return await db.update('todos', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int todoId) async {
    Database db = await database();
    return await db.delete('todos', where: "id = ?", whereArgs: [todoId]);
  }

  Future<List<Todo>> getTodos(int taskId) async {
    Database db = await database();
    List<Map<String, dynamic>> result =
        await db.query('todos', where: "task_id = ?", whereArgs: [taskId]);

    return List.generate(result.length, (index) => Todo.fromMap(result[index]));
  }
}
