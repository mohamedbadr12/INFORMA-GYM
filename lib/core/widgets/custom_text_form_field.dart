import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,required this.label,required this.controller,required this.validator});
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(10),
      child: TextFormField(

        controller:controller ,
        validator: validator,
        decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            labelText: label ,labelStyle: const TextStyle(color: Colors.white60),
            filled: true,
            fillColor: Colors.white10,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}