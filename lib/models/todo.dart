

class Todo {
  int? id;
  late String title;
  late bool isDone;
  late int taskId;

  Todo({ this.id, required this.title , required this.isDone , required this.taskId});


  Todo.fromMap(Map<String , dynamic> todo) {
      id = todo['id'];
      title = todo['title'];
      isDone = todo['isDone'] == 1;
      taskId = todo['task_id'];
  }


  Map<String , dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'task_id' : taskId,
      'isDone' : isDone ? 1 : 0
    };
  }
}