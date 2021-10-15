import 'package:myap/model/todotask.dart';

import 'package:myap/screens/task/todolist.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoListModel todoList = TodoListModel();

    todoList.getTasksFromSharedPrefs();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Todo List',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: todoList,
        child: TodoListWidget(),
      ),
    );
  }
}
