import 'package:flutter/material.dart';
import 'package:todoey/Components/Task_Tile.dart';
import 'package:todoey/Task.dart';

class TaskList extends StatefulWidget {
  final List<Task> taskList;
  final Function deleteHigh;

  TaskList({this.taskList, this.deleteHigh});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          widget.taskList.length, //ListView of all till length[tasklist.length]
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: widget.taskList[index].taskName,
          taskState: widget.taskList[index].isDone,
          checkBoxSetState: (newValue) {
            setState(() {
              widget.taskList[index].toggleDone();
            });
          },
          index: index,
          delete: (indexw) {
            widget.deleteHigh(indexw);
          },
        );
      },
    );
  }
}
