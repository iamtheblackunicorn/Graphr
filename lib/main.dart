/*
GRAPHR by Alexander Abraham a.k.a. "The Black Unicorn"
Licensed under the MIT license.
*/

import 'src/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Main etry point for the Dart VM.
void main(){
  runApp(
    new MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('de', ''),
      ],
    )
  );
}
