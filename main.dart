//create a todo app is used to add the text and remove the text using the diffeerent widget

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}
//stateful widget
class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "No Text Data";

  List<String> taskList = [];
//taskcontroller to control the task
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List App"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter a task"),
                      ),
                    ),
                  ),
                ),

                MaterialButton(
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: Text("Add"),
                ),
              ],
            ),
//use the expanded widget or otherwise use the flexiable widget with shrinkwrap is true
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(taskList[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            taskList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
