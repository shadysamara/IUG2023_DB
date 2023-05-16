import 'package:flutter/material.dart';
import 'package:iug_local_storage/custom_textfield.dart';
import 'package:iug_local_storage/mvc/controller/iug_provider.dart';
import 'package:provider/provider.dart';

class ProviderTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield('Enter The First Number',
                Provider.of<IugProvider>(context).firstController),
            CustomTextfield('Enter The Second Number',
                Provider.of<IugProvider>(context).secondController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<IugProvider>(context,listen: false).plusFun();
                    },
                    child: Text("Plus")),
                ElevatedButton(onPressed: () {
                      Provider.of<IugProvider>(context, listen: false)
                          .substractFunction();
                }, child: Text("SubStract")),
                ElevatedButton(onPressed: () {
                      Provider.of<IugProvider>(context, listen: false)
                          .multiplyFunction();
                }, child: Text("Multiply")),
                ElevatedButton(onPressed: () {
                      Provider.of<IugProvider>(context, listen: false)
                          .DevisionFunction();
                }, child: Text("Devision")),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
                visible: Provider.of<IugProvider>(context).result.isNotEmpty,
                child: Text(
                  "Result is: ${Provider.of<IugProvider>(context).result}",
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                ))
          ],
        ),
      ),
    );
  }
}
