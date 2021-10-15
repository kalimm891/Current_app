import 'package:flutter/foundation.dart';

class TaskModel extends ChangeNotifier {
  final String? text;
  bool completed;

  TaskModel({this.text, this.completed = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {'text': text, 'completed': completed};

  void toggle() {
    completed = !completed;
    notifyListeners();
  }
}
