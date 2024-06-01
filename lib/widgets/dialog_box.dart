import 'package:flutter/material.dart';
import 'package:todo_app/widgets/buttons.dart';

class DialogBox extends StatelessWidget {
  final mycontroller;
  final VoidCallback onSave;
  const DialogBox(
      {super.key, required this.mycontroller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: mycontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new Task here"),
              keyboardType: TextInputType.name,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(text: 'Add', onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                Buttons(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
