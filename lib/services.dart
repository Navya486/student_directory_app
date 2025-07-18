import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void>addstudent({
  required String NAME,required String CLASS,required String AGE,required String DEPARTMENT,required BuildContext context

})
async{
  await FirebaseFirestore.instance.collection("students").add({"NAME":NAME,"AGE":AGE,"CLASS":CLASS,"DEPARTMENT":DEPARTMENT});
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("submitted successfully")));
}