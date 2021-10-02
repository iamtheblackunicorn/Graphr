import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late final TextEditingController inputController;
  late final String hintText;
  CustomText({
    required this.inputController,
    required this.hintText
  });
  @override
  Widget build(BuildContext context){
    return new Padding(
      padding: EdgeInsets.all(20),
      child: new TextField(
        controller: inputController,
        maxLength: 250,
        maxLines: 1,
        maxLengthEnforced: true,
        autofocus: false,
        decoration: new InputDecoration(
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFFD6528A),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6528A),
              width: 2.0
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6528A),
              width: 2.0
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6528A),
              width: 2.0
            ),
          ),
        ),
        style: TextStyle(
          height: 2.0,
          color: Color(0xFFFFFFFF),
          fontSize: 25,
        )
      )
    );
  }
}
