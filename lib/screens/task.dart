import 'package:flutter/material.dart';
import 'package:test1/models/task.dart';
import 'package:test1/models/todo.dart';
import 'package:test1/services/database/todo.dart';
import 'package:test1/widgets/todo/addNewTodo.dart';
import 'package:test1/widgets/todoWidget.dart';

class TaskScreen extends StatefulWidget {
  Task? task;

  TaskScreen({super.key,  this.task });

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  initState() {
    super.initState();
    if(widget.task != null) {
      taskTitleController.text = widget.task?.title ?? "";
      taskDescriptionController.text = widget.task?.description ?? "";
    }
  }

  addTodo(value) {
    TodoDatabase().add(
      Todo(
        title: value,
        taskId : widget.task?.id ?? 0,
        isDone: false
      )
    );
    setState(() {});
  }


  toggleDoneTodo(id , status) {
    TodoDatabase().update(id , {
        'isDone' : status
    });
    setState(() {});
  }

  deleteTodo(id) {
      TodoDatabase().delete(id);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl, 
        child:  Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, widget.task);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextField(
                            controller: taskTitleController,
                            onSubmitted: (value) {
                              if(value != "") {
                                 if(widget.task == null) {
                                    setState(() {
                                      widget.task = Task(
                                        title: value,
                                        todos: []
                                      );
                                    });
                                  } else {
                                      widget.task?.title = value;
                                  }
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "عنوان کار شما",
                              border: InputBorder.none
                            ),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                Visibility(
                  visible: widget.task != null,
                  child: TextField(
                    controller: taskDescriptionController,
                    onSubmitted: (value) {
                      widget.task?.description = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "توضیح کار خود را در اینجا وارد کنید",
                      border: InputBorder.none
                    ),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14
                    ), 
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 3, 
                  ),
                ),
                Visibility(
                  visible: widget.task != null,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FutureBuilder(
                        initialData: [],
                        future: TodoDatabase().getTodos(widget.task?.id ?? 0),
                        builder: (context , snapshot) {
                          return ListView.builder(
                            itemCount: (snapshot.data as List).length,
                            itemBuilder: (context , index) => TodoWidget(
                              todo : (snapshot.data as List)[index],
                              toggleDone : toggleDoneTodo,
                              delete : deleteTodo
                            ),
                          );
                        },

                        )
                      ),  
                  ),
                ),
                Visibility(
                  visible: widget.task != null,
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(80, 0, 0, 0)
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      Expanded(
                        child: AddNewTodo(
                          addTodo : addTodo
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }

}