/*
GRAPHR by Alexander Abraham a.k.a. "The Black Unicorn"
Licensed under the MIT license.
*/

import 'input.dart';
import 'graph.dart';
import 'variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Home extends StatefulWidget{
  HomeState createState(){
    return HomeState();
  }
}
class HomeState extends State<Home> {

  /// Empty containers
  /// for the initial state
  /// of the app's state variables.
  late double xMax;
  late double yMax;
  late List<List<double>> coordinateList;
  @override

  /// Setting the initial "state"
  /// of the app with some default values.
  void initState(){
    super.initState();
    xMax = defaultXMax;
    yMax = defaultYMax;
    coordinateList = defaultCoordinateList;
  }

  /// This is the method that
  /// passes the output to the
  /// [Graph] widget.
  @override
  void processData(
    String xMaxVal,
    String yMaxVal,
    String valueList
  ){
    List<List<double>> endRes = [];
    List<String> coordList = valueList.split(' ');
    for (int i = 0; i < coordList.length; i++){
      String coordPair = coordList[i];
      List<String> coordPairs = coordPair.split(',');
      double xCoord = double.parse(coordPairs[0].replaceAll("[", ""));
      double yCoord = double.parse(coordPairs[1].replaceAll("]", ""));
      List<double> coordinatePair = [xCoord,yCoord];
      endRes.add(coordinatePair);
    }

    /// After the input data has been processed
    /// we update the state variables accordingly.
    setState((){
      xMax = double.parse(xMaxVal);
      yMax = double.parse(yMaxVal);
      coordinateList = endRes;
    });
  }

  /// This method returns the main widget tree.
  @override
  Widget build(BuildContext context){
    TextEditingController xMaxInputController = new TextEditingController();
    TextEditingController yMaxInputController = new TextEditingController();
    TextEditingController valueInputController = new TextEditingController();
    String xMaxLabel = AppLocalizations.of(context)!.xMaxLabel;
    String yMaxLabel = AppLocalizations.of(context)!.yMaxLabel;
    String valueListLabel = AppLocalizations.of(context)!.valueListLabel;
    String renderLabel = AppLocalizations.of(context)!.renderLabel;
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Container(
            width: MediaQuery.of(context).size.width,
            child:new Column(
              children: <Widget> [
                new Padding(
                  padding: EdgeInsets.all(inputPadding),
                  child: new Container(
                    child: new Input(
                      xMaxHintText: xMaxLabel,
                      yMaxHintText: yMaxLabel,
                      valueHintText: valueListLabel,
                      xMaxInputController:xMaxInputController,
                      yMaxInputController:yMaxInputController,
                      valueInputController:valueInputController
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          babyBlue,
                          babyPink
                        ]
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(stdRounding)
                      ),
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.all(inputPadding),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: new CustomPaint(

                      /// Here we swap out all the variables that
                      /// change ipon input from the user.
                      painter:new Graph(
                        xMax: xMax,
                        yMax: yMax,
                        coordinateList: coordinateList
                      )
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          babyBlue,
                          babyPink
                        ]
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(stdRounding)
                      ),
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.all(
                    stdRounding
                  ),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          stdRounding
                        )
                      ),
                      padding: EdgeInsets.only(
                        top: stdFontSize,
                        bottom: stdFontSize,
                      ),
                      color: babyBlue,
                      child: new Text(
                        renderLabel,
                        style: TextStyle(
                          color: strokeColor,
                          fontSize: stdFontSize,
                          fontFamily: fontFam
                        )
                      ),
                      onPressed: () {
                        /// Here we actually get
                        /// the user's input and process
                        /// the input.
                        processData(
                          xMaxInputController.text,
                          yMaxInputController.text,
                          valueInputController.text
                        );
                      }
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}
