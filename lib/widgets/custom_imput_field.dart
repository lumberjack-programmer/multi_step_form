import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;
  const CustomInput({Key? key, this.onChanged, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      child: TextField(
        focusNode: FocusNode(),
        onChanged: (v) => onChanged!(v),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
            hintText: hint!,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 10,
                color: Colors.white,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(15.0,),
            ),),
      ),
    );
  }
}
