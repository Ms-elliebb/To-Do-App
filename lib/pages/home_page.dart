// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilitys/dialog_box.dart';
import 'package:flutter_application_1/utilitys/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
   State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _myBox= Hive.openBox('mybox');

  //text controller 
final _controller= TextEditingController();
  

  //list of todo tasks
  List toDoList=[
    ["brush your teeth",false],
    ["Go to gym",false],

  ];
  //checkbox was clicked
  void checkBoxChanged(bool? value,int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1];
    });

  }
  //save new Task 
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }


  //createtask method
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
      return DialogBox(
        controller:_controller ,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(), //dismiss the dialog box
      );
    },);
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_circle)
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
          return ToDoTile(TaskName: toDoList[index][0], 
          taskComplated: toDoList[index][1], 
          OnChanged:(value) =>  checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index),
          );
        },


      ),
       
         
         
         
        );
    
  }
}