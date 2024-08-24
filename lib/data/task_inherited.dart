import 'package:first_app/components/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  List<Task> taskList = [
    Task(title: 'Assistir jogo', dificulty: 1),
    Task(title: 'Curar sinusite', dificulty: 5),
  ];

  void addNew(String newTitle, int newDificulty, String url) {
    taskList.add(Task(
      title: newTitle,
      dificulty: newDificulty,
      image: url,
    ));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
