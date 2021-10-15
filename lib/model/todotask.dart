import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:myap/model/taskmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListModel extends ChangeNotifier {
  List<TaskModel> tasks = [];
  List<TaskModel> tasksCopy = [];

  void addTaks(TaskModel task) {
    tasks.add(task);
    notifyListeners();
  }

  void filterTasks(String searched) {
    if (searched != null) {
      // print(searched);

      var response =
          tasks.where((element) => element.text == searched).toList();

      // print(response);
      tasksCopy = response;

      // print(response);

      // tasks.forEach((item) {
      //   print(item);
      //   if (item.text!.contains(searched)) {
      //     tasksCopy.add(item);
      //   }
      // });
      notifyListeners();
    }
    //  else {
    //   tasksCopy = [];
    //   notifyListeners();
    // }
  }

  Future<void> getTasksFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks') ?? '[]';

    final jsonListTasks = jsonDecode(tasksJson).cast<Map<String, dynamic>>();
    tasks = jsonListTasks.map<TaskModel>((m) => TaskModel.fromJson(m)).toList();
    notifyListeners();
  }

  Future<void> saveTasksToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(tasks);
    prefs.setString('tasks', json);
  }
}
