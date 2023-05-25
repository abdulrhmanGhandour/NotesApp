import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp2/components/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.labelText, this.onChanged, this.maxline = 1, this.onSaved});

  final Function(String)? onChanged;
  final String? labelText;
  final int? maxline;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is requried';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxline,
      onChanged: onChanged,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        border: bulidOutlineBorder(),
        enabledBorder: bulidOutlineBorder(),
        focusedBorder: bulidOutlineBorder(KPrimaryColor),
        hintStyle: TextStyle(color: KPrimaryColor),
        hintText: labelText,
      ),
    );
  }

  OutlineInputBorder bulidOutlineBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
