import 'package:get/get.dart';

import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title) {
    todos.add(Todo(title: title));
  }

  void toggleTodoStatus(int index) {
    var todo = todos[index];
    todo.isDone = !todo.isDone;
    todos[index] = todo;
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
