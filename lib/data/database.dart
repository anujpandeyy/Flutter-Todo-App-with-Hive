import 'package:hive/hive.dart';

class ToDoDataBase {
  List data = [];
  final _myBox = Hive.box('mybox');
  void createInit() {
    data = [
      ['Gym', false],
      ['Code', true],
    ];
  }

  void loadData() {
    data = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", data);
  }
}
