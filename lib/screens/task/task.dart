import 'package:flutter/material.dart';
import 'package:myap/model/taskmodel.dart';
import 'package:myap/model/todotask.dart';

import 'package:provider/provider.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextStyle _taskStyle(completed) {
    if (completed)
      return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    else
      return TextStyle(decoration: TextDecoration.none);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, task, child) {
        return Dismissible(
          key: UniqueKey(),
          child: CheckboxListTile(
            title: Text(
              task.text!,
              style: _taskStyle(task.completed),
            ),
            value: task.completed,
            onChanged: (newValue) {
              task.toggle();

              Provider.of<TodoListModel>(context, listen: false)
                  .saveTasksToSharedPrefs();
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          background: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
