import 'package:flutter/material.dart';
import 'package:myap/model/taskmodel.dart';
import 'package:myap/model/todotask.dart';
import 'package:myap/screens/task/task.dart';

import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Consumer<TodoListModel>(builder: (context, tasks, child) {
        return Container(
          width: 200,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (val) {
              tasks.filterTasks(val);
            },
          ),
        );
      }),
      Expanded(
        child: Consumer<TodoListModel>(builder: (context, taskscopy, child) {
          return ListView(
              children: taskscopy.tasksCopy.map((TaskModel task) {
            return ChangeNotifierProvider.value(
              value: task,
              child: TaskWidget(),
            );
          }).toList());
        }),
      ),
      Expanded(
          child: Consumer<TodoListModel>(builder: (context, taskscopy, child) {
        return ListView(
            children: taskscopy.tasks.map((TaskModel task) {
          return ChangeNotifierProvider.value(
            value: task,
            child: TaskWidget(),
          );
        }).toList());
      })),
      Consumer<TodoListModel>(
        builder: (context, tasks, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'new task'),
              onSubmitted: (newTask) {
                tasks.addTaks(TaskModel(text: newTask));

                _controller.clear();
                tasks.saveTasksToSharedPrefs();
              },
            ),
          );
        },
      )
    ]);
  }
}
