import 'package:flutter/material.dart';
import 'package:myap/model/todotask.dart';

import 'package:myap/screens/Todo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodoListModel task = TodoListModel();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(value: task, child: Home()),
    );
  }
}
