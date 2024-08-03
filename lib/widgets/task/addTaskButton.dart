

import 'package:flutter/material.dart';
import 'package:test1/models/task.dart';
import 'package:test1/screens/task.dart';

class AddTaskButton extends StatelessWidget {
  final Function addTask;

  AddTaskButton({ required this.addTask });


  void switchToCreateTask(context) async {
    Task? task = await Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => TaskScreen()
      )
    );

    if(task != null) {
      addTask(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: 10,
              left: 0,
              child: GestureDetector(
                onTap: () => switchToCreateTask(context),
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ),
            );
  }

}