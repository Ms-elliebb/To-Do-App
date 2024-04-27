// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utilitys/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[400],
      content:Container(
        height:240,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          TextField(
            controller: controller ,
            decoration: InputDecoration(
              border:OutlineInputBorder(),
              hintText: "Add a new Task",
          ),
          ),
          
          //buttons--- save + cancel
           Row(
            mainAxisAlignment:MainAxisAlignment.center,
            
            children: [
            //save button
            MyButton(text: "Save", onPressed:(){}) ,
            const SizedBox(width: 50,),
            //cancel button
           MyButton(text: "Cancel", onPressed:(){}) ,
            ],
          ),



        ],)
      )
    );
  }
}