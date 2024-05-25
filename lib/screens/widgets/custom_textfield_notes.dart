import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hint,  this.maxLine =1, this.onSaved, this.onChanged}) : super(key: key);
  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      onSaved: onSaved ,
      validator: (value){
        if(value?.isEmpty ?? true){
          return "Field is required";
        }
      },
      maxLines: maxLine,
      cursorColor: kPrimaryColor,
      showCursor: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color:kPrimaryColor,),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kPrimaryColor)
        ),
      ),

    );
  }
}
