import 'package:hive/hive.dart';



class TodoDataBase {
  List todoList = [];
  // reference my box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
  }

  // if this is the first time ever opening the app, then create default data
  bool ifAppOpenBefore() {
    if (_myBox.get('todoList') == null) {
      return true;
    } else {
      return false;
    }
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get('todoList');
  }

  // update the database
  void updateDataBase() {
    _myBox.put('todoList', todoList);
  }
}
