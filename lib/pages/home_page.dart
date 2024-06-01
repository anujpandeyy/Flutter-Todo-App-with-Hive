import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/my_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInit();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBox(bool? value, int index) {
    setState(() {
      db.data[index][1] = !db.data[index][1];
    });
    db.updateData();
  }

  void addTask(BuildContext context) {
    setState(() {
      db.data.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.data.removeAt(index);
    });
    db.updateData();
  }

  void showDialogBox() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              mycontroller: _controller,
              onSave: () {
                addTask(context);
              },
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'TODO',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: showDialogBox,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.data.length,
        itemBuilder: (context, index) {
          return MyList(
            name: db.data[index][0],
            status: db.data[index][1],
            onChanged: (value) => checkBox(value, index),
            deleteFunction: (context) {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
