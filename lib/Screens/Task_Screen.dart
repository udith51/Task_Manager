import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Components/Task_List.dart';
import 'package:todoey/Components/Add_Task_Screen.dart';
import 'package:todoey/Task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> taskList = [];

  void taskAdded(newTaskTitle) {
    print(newTaskTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${taskList.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: taskList.length == 0
                  ? Center(
                      child: Container(
                        child: Text(
                          'Click on  "+"  to add tasks',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                    )
                  : TaskList(
                      taskList: taskList,
                      deleteHigh: (indexw1) {
                        setState(() {
                          taskList.removeAt(indexw1);
                        });
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskScreen(
              addTaskScreenCallBack: (String newTask) {
                setState(() {
                  taskList.add(
                    Task(taskName: newTask),
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
