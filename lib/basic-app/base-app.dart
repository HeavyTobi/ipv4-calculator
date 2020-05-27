import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/basic-scaffold.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'IPv4 Calculator';

    return Platform.isIOS
        ? CupertinoApp(
            title: title,
            home: BasicScaffold(
              title: title,
            ),
          )
        : MaterialApp(
            title: title,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark(),
            home: BasicScaffold(
              title: title,
            ),
          );
  }
}
