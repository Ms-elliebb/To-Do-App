import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String TaskName;
  final bool taskComplated;
  Function(bool?)? OnChanged;

  ToDoTile({super.key,
  required this.TaskName,
  required this.taskComplated,
  required this.OnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right:25,top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.purple[300],
        borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            //check Box
           Checkbox(value: taskComplated,
            onChanged: OnChanged,
            activeColor: Colors.purple,
            ),
            //task name
            Text(
              TaskName,
              style: TextStyle(decoration: taskComplated ? TextDecoration.lineThrough:TextDecoration.none,),
            ),
          ],
        )
      ),
    );
  }
}