import 'package:flutter/material.dart';
import 'package:test1/models/task.dart';
import 'package:test1/services/database/core.dart';
import 'package:test1/services/database/task.dart';
import 'package:test1/widgets/task/addTaskButton.dart';
import 'package:test1/widgets/task/heroSection.dart';
import 'package:test1/widgets/task/taskItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    TaskDatabase().getTasks().then((List<Task> taskData) {
      setState(() {
        tasks = taskData;
      });
    });
  }

  void addNewTask(Task task) {
    setState(() {
      tasks.add(task);
    });
    TaskDatabase().add(task);
  }

  void updateTask(Task task) {
    setState(() {
      tasks = tasks.map((taskItem) {
        if (taskItem.id == task.id) {
          return task;
        }
        return taskItem;
      }).toList();
    });
    TaskDatabase().update(task.id ?? 0, task);
  }

  void deleteTask(int taskId) {
    setState(() {
      tasks = tasks.where((task) => task.id != taskId).toList();
    });
    TaskDatabase().delete(taskId);
  }

  @override
  Widget build(BuildContext context) {
    CoreDatabase().database();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              width: 40,
                              height: 40,
                              image: AssetImage("assets/logo.png"),
                            ),
                            Icon(Icons.menu, size: 28)
                          ],
                        ),
                        HeroSection(),
                        Expanded(
                            child: ListView.builder(
                              itemCount: tasks.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  TaskItem(
                                      context: context,
                                      index: index,
                                      task: tasks[index],
                                      updateTask: updateTask,
                                      delete: deleteTask),
                            )),
                      ],
                    ),
                    AddTaskButton(addTask: addNewTask)
                  ],
                ),
              )
          ),
        ));
  }
}
