/*
GRAPHR by Alexander Abraham a.k.a. "The Black Unicorn"
Licensed under the MIT license.
*/

import 'variables.dart';
import 'package:flutter/material.dart';

/// Using a custom [TextField] to
/// adhere to the DRY principle.
/// Repetition is bad for performance.
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
      padding: EdgeInsets.all(stdFontSize),
      child: new TextField(
        cursorColor: strokeColor,
        cursorWidth: strokeWidth,
        controller: inputController,
        maxLength: maxCharLength,
        maxLines: maxLines,
        maxLengthEnforced: isSo,
        autofocus: isNotSo,
        decoration: new InputDecoration(
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: stdFontSize,
            color: strokeColor,
            fontFamily: fontFam
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: strokeColor,
              width: inputStrokeWidth
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: strokeColor,
              width: inputStrokeWidth
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: strokeColor,
              width: inputStrokeWidth
            ),
          ),
        ),
        style: TextStyle(
          height: inputStrokeWidth,
          color: strokeColor,
          fontSize: stdFontSize,
          fontFamily: fontFam
        )
      )
    );
  }
}
