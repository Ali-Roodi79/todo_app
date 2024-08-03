


import 'package:flutter/material.dart';
import 'package:test1/models/todo.dart';

class TodoWidget extends StatelessWidget {
  Function toggleDone;
  Function delete;
  Todo todo;

  TodoWidget({ required this.todo, required this.toggleDone , required this.delete});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => toggleDone(todo.id , !todo.isDone),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color : todo.isDone ? Colors.red[300] : Colors.grey[400],
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: todo.isDone ? Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white
                    ): null,
                  ),
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: todo.isDone ? Colors.red[300] : Colors.grey[800],
                      decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () => delete(todo.id),
                child: Icon(
                  Icons.delete,
                  color: Colors.red[300],
                ),
              )
            ],
          ),
      ),
    );
  }

}