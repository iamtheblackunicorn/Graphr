/*
GRAPHR by Alexander Abraham a.k.a. "The Black Unicorn"
Licensed under the MIT license.
*/

import 'variables.dart';
import 'package:flutter/material.dart';

/// Our home-rolled [CustomPainter]
/// widget to draw points with
/// lines and points as a graph.
/// Fell free to re-use this.
class Graph extends CustomPainter{
  late final List<List<double>> coordinateList;
  late double yMax;
  late double xMax;
  Graph({
    required this.coordinateList,
    required this.yMax,
    required this.xMax
  });

  /// Getting the Offset
  /// from a list of points.
  /// We need this method to
  /// actually connect points.
  @override
  Offset getOffset(
    List<double> numberPair,
    double xUnit,
    double yUnit,
    Offset origin
  ){
    List<double> pointCoordinates = numberPair;
    double xCoordinate = origin.dx + (pointCoordinates[0] * xUnit);
    double yCoordinate = origin.dy - (pointCoordinates[1] * yUnit);
    Offset point = Offset(xCoordinate, yCoordinate);
    return point;
  }

  @override
  void paint(Canvas canvas, Size size){

    /// General variables for rendering
    /// a custom widget.
    Paint pointPaint = new Paint();
    pointPaint.color = graphColor;
    pointPaint.strokeWidth = strokeWidth;
    double radius = pointRadius;

    /// Setting up the origin.
    double sizeY = size.height - (size.height/8);
    double sizeX = 0 + size.width/12;
    Offset origin = Offset(sizeX,sizeY);
    canvas.drawCircle(origin, radius, pointPaint);

    /// Setting up the origin on top.
    double sizeYUpDown = 0 + (size.height/8);
    double sizeXUpDown = 0 + size.width/12;
    Offset originUp = Offset(sizeXUpDown,sizeYUpDown);
    canvas.drawCircle(originUp, radius, pointPaint);

    /// Setting up the origin in the
    /// lower right-hand corner.
    double sizeYDown = 0 + (7*(size.height/8));
    double sizeXDown = 0 + (11*(size.width/12));
    Offset originDown = Offset(sizeXDown,sizeYDown);
    canvas.drawCircle(originDown, radius, pointPaint);

    /// Drawing lines between the three.
    canvas.drawLine(origin, originUp, pointPaint);
    canvas.drawLine(origin, originDown, pointPaint);

    /// Setting up the units inside the graphn field.
    double yMaxRestriction = origin.dy - originUp.dy;
    double xMaxRestriction = originDown.dx - origin.dx;
    double oneUnitY = yMaxRestriction / yMax;
    double oneUnitX = yMaxRestriction / xMax;

    /// Plotting the points.
    for (int i = 0; i < coordinateList.length; i++){
      // Drawing and
      // connecting the point(s).
      if (i == 0){
        Offset currentPoint = getOffset(
          coordinateList[i],
          oneUnitX,
          oneUnitY,
          origin
        );
        canvas.drawCircle(currentPoint, radius, pointPaint);
        canvas.drawLine(origin, currentPoint, pointPaint);
      }
      else {
        Offset currentPoint = getOffset(
          coordinateList[i],
          oneUnitX,
          oneUnitY,
          origin
        );
        Offset previousPoint = getOffset(
          coordinateList[i-1],
          oneUnitX,
          oneUnitY,
          origin
        );
        canvas.drawCircle(currentPoint, radius, pointPaint);
        canvas.drawLine(previousPoint, currentPoint, pointPaint);
      }
    }
  }

  /// Telling the [CustomPainter] to re-draw
  /// the canvas when the app's state changes.
  @override
  bool shouldRepaint(Graph oldDelegate){
    return true;
  }

}
