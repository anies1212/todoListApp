import 'package:flutter/material.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/widget/dialog_box.dart';
import 'package:to_do_app/widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _controller = TextEditingController();
  TodoDataBase dataBase = TodoDataBase();

  @override
  void initState() {
    if (dataBase.ifAppOpenBefore()) {
      dataBase.createInitialData();
    } else {
      dataBase.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(int index) {
    setState(() {
      dataBase.todoList[index][1] = !dataBase.todoList[index][1];
    });
    dataBase.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          title: 'Add Todo List',
          onPressedAddButton: saveNewTask,
          onPressedCancelButton: () => Navigator.of(context).pop(),
          controller: _controller,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      dataBase.todoList.removeAt(index);
    });
    dataBase.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      dataBase.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    dataBase.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
          itemCount: dataBase.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: dataBase.todoList[index][0],
              isTaskCompleted: dataBase.todoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (value) => deleteTask(index),
            );
          }),
    );
  }
}
