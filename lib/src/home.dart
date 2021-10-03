import 'package:flutter/material.dart';
import 'input.dart';
import 'graph.dart';

class Home extends StatefulWidget{
  HomeState createState(){
    return HomeState();
  }
}
class HomeState extends State<Home> {
  late double xMax;
  late double yMax;
  late List<List<double>> coordinateList;
  @override
  void initState(){
    super.initState();
    xMax = 8.0;
    yMax = 8.0;
    coordinateList = [
      [2.0,2.0],
      [3.0,3.0],
      [4.0, 4.0]
    ];
  }
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
    setState((){
      xMax = double.parse(xMaxVal);
      yMax = double.parse(yMaxVal);
      coordinateList = endRes;
    });
  }
  @override
  Widget build(BuildContext context){
    TextEditingController xMaxInputController = new TextEditingController();
    TextEditingController yMaxInputController = new TextEditingController();
    TextEditingController valueInputController = new TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Container(
            width: 2.5*(MediaQuery.of(context).size.width/3),
            child:new Column(
              children: <Widget> [
                new Padding(
                  padding: EdgeInsets.all(30),
                  child: new Container(
                    child: new Input(
                      xMaxHintText: 'X Max',
                      yMaxHintText: 'Y Max',
                      valueHintText: 'Value List',
                      xMaxInputController:xMaxInputController,
                      yMaxInputController:yMaxInputController,
                      valueInputController:valueInputController
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF087DFB),
                          Color(0xFFD6528A)
                        ]
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25)
                      ),
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.all(30),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: new CustomPaint(
                      painter:new Graph(
                        xMax: xMax,
                        yMax: yMax,
                        coordinateList: coordinateList
                      )
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF087DFB),
                          Color(0xFFD6528A)
                        ]
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25)
                      ),
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.all(
                    25
                  ),
                  child: new Container(
                    width: 2.5*(MediaQuery.of(context).size.width/3),
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25
                        )
                      ),
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      color: Color(0xFF087DFB),
                      child: new Text(
                        'RENDER',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 25,
                        )
                      ),
                      onPressed: () {
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
