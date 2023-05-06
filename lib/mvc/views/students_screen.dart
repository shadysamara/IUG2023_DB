import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controllers/db_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return NewStudentScreen(getAllStudents);
              // }));
            }),
        appBar: AppBar(
          title: Text('Students screen'),
        ),
        body: Consumer<DbController>(

          builder: (context, controller, x) {
            return controller.isLoading?
           const Center(child: CircularProgressIndicator(),):
            
            
            controller.students.isEmpty?
             Center(child: Lottie.asset('assets/animations/empty.json') ):
            ListView.builder(
                itemCount: controller.students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          controller.deleteStudent(controller.students[index].id!);
                        
                        },
                        icon: Icon(Icons.delete)),
                    title: Text(controller.students[index].name ?? ''),
                    subtitle: Text(controller.students[index].gpa.toString() ),
                  );
                });
          },
        ));
  }
}
