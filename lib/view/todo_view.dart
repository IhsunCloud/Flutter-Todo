import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/todo_controller.dart';

class TodoApp extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App with GetX'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(hintText: 'Enter new todo'),
                    onSubmitted: (value) {
                      todoController.addTodo(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    todoController.addTodo('New Task');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        todoController.deleteTodo(index);
                      },
                    ),
                    onTap: () {
                      todoController.toggleTodoStatus(index);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
