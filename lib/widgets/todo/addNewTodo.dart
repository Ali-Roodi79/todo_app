

import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget {
  TextEditingController newTodoInputController = TextEditingController();
  final Function addTodo;

  AddNewTodo({ required this.addTodo });

  @override
  Widget build(BuildContext context) {
      return 
      TextField(
        controller: newTodoInputController,
        onSubmitted: (value) {
            if(value != "") {
              addTodo(value);
              newTodoInputController.clear();
              
            }
        },
        decoration: InputDecoration(
          hintText: "کار جدید به لیست کارها اضافه کنید",
          border: InputBorder.none
        ),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14
        ),
      );
  }

}