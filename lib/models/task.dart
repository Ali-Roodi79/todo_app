import 'package:test1/models/todo.dart';

class Task {
  int? id;
  late String title;
  String? description;
  List<Todo> todos;

  Task({ required this.title , this.id , this.description , required this.todos });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'description' : description
    };
  }
}