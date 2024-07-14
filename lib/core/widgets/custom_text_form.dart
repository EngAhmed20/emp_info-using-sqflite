import 'package:flutter/material.dart';

class customTextForm extends StatelessWidget {
   customTextForm({super.key,  this.maxLine=1, required this.title,
    this.onSaved,this.controller, this.onChanged, this.prefIcon,
    this.readOnly=false, this.hintStyle, this.textAlign=TextAlign.start,
    this.onTap,this.keyboardType
  });
  final int maxLine;
  final String title;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final IconData? prefIcon;
  final bool readOnly;
  final TextStyle? hintStyle;
  final TextAlign textAlign;
  void Function()? onTap;
  TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      onSaved: onSaved,
      keyboardType: keyboardType,
      onTap:onTap ,
      onChanged: onChanged,
      textAlign: textAlign,
      readOnly: readOnly,
      validator: (value)
        {
          if(value!.isEmpty)
          {
            return 'Filed is required';
          }
          return null;
        },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border:buildBoarder(),
        enabledBorder: buildBoarder(),
        focusedBorder: buildBoarder(),
        hintText: title,
        hintStyle: hintStyle,
        prefixIcon:Icon(prefIcon) ,

    )
    );
  }
  OutlineInputBorder buildBoarder([color])
  {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: color??Colors.grey,
        width: 1,
      ),
    );
  }
}
