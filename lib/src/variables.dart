/*
GRAPHR by Alexander Abraham a.k.a. "The Black Unicorn"
Licensed under the MIT license.
*/

import 'package:flutter/material.dart';

/// General variables.
bool isSo = true;
bool isNotSo = false;
double stdRounding = 25;
Color babyBlue = Color(0xFF087DFB);
Color babyPink = Color(0xFFD6528A);

/// Graph painter variables.
Color graphColor = Color(0xFFFFFFFF);
double strokeWidth = 4.0;
double pointRadius = 10.0;

/// Input sub-widget vars.
double inputPadding = 30;

/// [CustomText] variables.
String fontFam = 'PSB';
Color strokeColor = Color(0xFFFFFFFF);
double stdFontSize = 20;
double inputStrokeWidth = 2.0;
int maxCharLength = 250;
int maxLines = 1;

/// Main widget tree variables.
double defaultXMax = 8.0;
double defaultYMax = 9.0;
List<List<double>> defaultCoordinateList = [
  [2.0,2.0],
  [3.0,3.0],
  [4.0, 4.0]
];
