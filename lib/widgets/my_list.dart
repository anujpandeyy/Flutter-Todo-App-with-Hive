import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyList extends StatelessWidget {
  const MyList({
    super.key,
    required this.name,
    required this.status,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String name;
  final bool status;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ]),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //check
                  Checkbox(
                    value: status,
                    onChanged: onChanged,
                  ),

                  //name
                  Text(
                    name,
                    style: TextStyle(
                      decoration: status
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
