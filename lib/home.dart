import 'package:flutter/material.dart';
import 'package:student_directory_app/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController NAME=TextEditingController();
  TextEditingController CLASS=TextEditingController();
  TextEditingController AGE=TextEditingController();
  TextEditingController DEPARTMENT=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Student directory app"),
        centerTitle: true,), floatingActionButton:
    FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("add student"),
              content: Column(children:
              [
                TextField(controller:NAME,decoration: InputDecoration(labelText: "NAME",
                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(4), borderSide: BorderSide(
                        color: Colors.black)
                    )
                )
                ),
                SizedBox(height: 10),
                TextField(controller:CLASS,
                    decoration: InputDecoration(labelText: "CLASS",
                  border: OutlineInputBorder(borderRadius: BorderRadius
                      .circular(4), borderSide: BorderSide(
                      color: Colors.black)
                  )
              )
              ),
                SizedBox(height: 10),
                TextField(controller:AGE,decoration: InputDecoration(labelText: "AGE",
                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(4), borderSide: BorderSide(
                        color: Colors.black)
                    )
                )
                ),
                SizedBox(height: 10),
                TextField(controller:DEPARTMENT,decoration: InputDecoration(labelText: "DEPARTMENT",
                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(4), borderSide: BorderSide(
                        color: Colors.black)
                    )
                )
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  addstudent(NAME: NAME.text, CLASS: CLASS.text, AGE: AGE.text, DEPARTMENT: DEPARTMENT.text, context: context);
                }, child: Text("add"))
              ],
              ),
            );
          },

        );
      },child: Icon(Icons.add),
    ),
    );
  }
}
