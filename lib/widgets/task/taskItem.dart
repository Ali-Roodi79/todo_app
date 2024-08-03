


import 'package:flutter/material.dart';
import 'package:test1/models/task.dart';
import 'package:test1/screens/task.dart';

class TaskItem extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Task task;
  final Function updateTask;
  final Function delete;

  TaskItem({required this.context , required this.index , required this.task, required this.updateTask  , required this.delete });

  @override
  Widget build(BuildContext context) {
      return 
      GestureDetector(
        onTap: () async {
          Task task = await Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => TaskScreen(task : this.task)
            )
          );

          updateTask(task);
          // if(task != null) {
          //   addTask(task);
          // }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),

                    ),
                    Text(
                      task.description ?? "توضیحی هنوز وارد نشده است",
                      style: TextStyle(
                        color: Colors.grey[600]
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector( 
                onTap: () {
                  delete(task.id);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red[300],
                  size: 20,
                ),
              )
            ],
          ),
        ),
      );
  }

}