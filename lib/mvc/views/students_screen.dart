import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:iug_local_storage/mvc/views/new_student.dart';

class StudentsScreen extends StatefulWidget {
  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  List<Student>? students;
  getAllStudents() async {
    students = await DbHelper.dbHelper.getAllStudent();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NewStudent(getAllStudents);
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Students Page"),
      ),
      body: ListView.builder(
          itemCount: students?.length ?? 0,
          itemBuilder: (context, index) {
            return Dismissible(
              secondaryBackground: Container(
                color: Colors.green,
                child: Center(child:Text("Update"))),
              background: Container(
                color: Colors.red,
                child: Center(child:Text("Delete"))),
              onDismissed: (direction) {
             
                  DbHelper.dbHelper.deleteStuent(students![index].id!);
             
              },
              key: ObjectKey(students![index]),
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: students![index].isMale
                        ? Colors.blue
                        : Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: IconButton(onPressed: (){
                     Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NewStudent(getAllStudents, students![index]);
                        })); 
                  }, icon: Icon(Icons.edit)),
                  title: Text(students?[index].name ?? ''),
                  subtitle: Text(students?[index].gpa.toString() ?? ''),
                ),
              ),
            );
          }),
    );
  }
}
