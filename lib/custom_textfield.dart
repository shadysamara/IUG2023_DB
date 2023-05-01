import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextfield(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
