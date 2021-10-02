import 'text.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget{
  late final String xMaxHintText;
  late final String yMaxHintText;
  late final String valueHintText;
  late final TextEditingController xMaxInputController;
  late final TextEditingController yMaxInputController;
  late final TextEditingController valueInputController;
  Input({
    required this.xMaxHintText,
    required this.yMaxHintText,
    required this.valueHintText,
    required this.xMaxInputController,
    required this.yMaxInputController,
    required this.valueInputController
  });
  @override
  Widget build(BuildContext context){
    TextEditingController inputController
      = new TextEditingController();
    return Container(
      child: new Padding(
        padding: EdgeInsets.all(30),
        child: new Center(
          child: new Column(
            children: <Widget> [
              new CustomText(
                inputController: xMaxInputController,
                hintText: xMaxHintText
              ),
              new CustomText(
                inputController: yMaxInputController,
                hintText: yMaxHintText
              ),
              new CustomText(
                inputController: valueInputController,
                hintText: valueHintText
              )
            ]
          )
        )
      )
    );
  }
}
