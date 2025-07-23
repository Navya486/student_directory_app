import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_directory_app/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController NAME = TextEditingController();
  TextEditingController CLASS = TextEditingController();
  TextEditingController AGE = TextEditingController();
  TextEditingController DEPARTMENT = TextEditingController();
  String ?dataid;

  void editform({DocumentSnapshot? data}) {
    if (data != null) {
      NAME.text = data["NAME"];
      AGE.text = data["AGE"];
      CLASS.text = data["CLASS"];
      DEPARTMENT.text = data["DEPARTMENT"];
      dataid = data.id;
    }
    else {
      NAME.clear();
      AGE.clear();
      CLASS.clear();
      DEPARTMENT.clear();
    }
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text("edit student"),
        content: Column(children: [
          TextField(controller: NAME, decoration: InputDecoration()),
          TextField(controller: AGE, ),
          TextField(controller: CLASS, ),
          TextField(controller: DEPARTMENT),
          ElevatedButton(onPressed: () {

          }, child: Text("update"))

        ],),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Student directory app"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("add student"),
                content: Column(
                  children: [
                    TextField(
                      controller: NAME,
                      decoration: InputDecoration(
                        labelText: "NAME",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: CLASS,
                      decoration: InputDecoration(
                        labelText: "CLASS",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: AGE,
                      decoration: InputDecoration(
                        labelText: "AGE",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: DEPARTMENT,
                      decoration: InputDecoration(
                        labelText: "DEPARTMENT",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        addstudent(
                          NAME: NAME.text,
                          CLASS: CLASS.text,
                          AGE: AGE.text,
                          DEPARTMENT: DEPARTMENT.text,
                          context: context,
                        );
                      },
                      child: Text("add"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: fetchstudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final studentdata = snapshot.data!.docs;
          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(studentdata[index]["NAME"]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentdata[index]["AGE"]),
                    Text(studentdata[index]["CLASS"]),
                    Text(studentdata[index]["DEPARTMENT"],
                      style: TextStyle(fontSize: 20),),

                  ],
                ),
                trailing: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      editform(data: studentdata[index]);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {
                      deletestudent(studentdata[index].id);
                    }, icon: Icon(Icons.delete)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
