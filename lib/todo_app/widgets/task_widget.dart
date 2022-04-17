import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/data/tasks_data.dart';
import 'package:state_managment/todo_app/models/task_model.dart';
import 'package:state_managment/todo_app/pages/all_tasks.dart';

class TaskWidget extends StatefulWidget {
  Function fun;
  Task task;
  TaskWidget(this.task, this.fun);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widget.task.isCompleted ? Colors.green : Colors.black45,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
       Checkbox(
        value: widget.task.isCompleted,
        onChanged: (v) {
          widget.fun(widget.task);
        },
      ),
          Expanded(
              child: Text(widget.task.title),),
          IconButton( icon: Icon(Icons.delete),
              onPressed: (){
                deleteItem(widget.task);
              })
        ],
      ),
    );
  }

  deleteItem(Task task) {
    int index = tasksList.indexOf(task);
    tasksList.removeAt(index);
    setState(() {});
  }

}
