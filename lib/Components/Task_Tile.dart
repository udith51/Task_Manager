import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskState;
  final Function checkBoxSetState;
  final Function delete;
  final int index;
  TaskTile(
      {this.taskName,
      this.taskState,
      this.checkBoxSetState,
      this.delete,
      this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        delete(index);
      },
      title: Text(
        taskName,
        style: taskState
            ? TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: taskState,
        onChanged: checkBoxSetState,
      ),
    );
  }
}
