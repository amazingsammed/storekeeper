import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
 final TextInputType? keyboardtype;
final  Function(String)? onChange;

final  TextEditingController? controller;
  CustomTextfield(
      {super.key, required this.label, this.controller, this.keyboardtype,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        keyboardType: keyboardtype,
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            label: Text(label)),
      ),
    );
  }
}
