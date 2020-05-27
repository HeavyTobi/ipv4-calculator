import 'package:IPv4Calculator/ui/basic-scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'IPv4 Calculator';

    return PlatformApp(
      title: title,
      android: (_) => MaterialAppData(
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData.dark(),
        ),
      ios: (_) => CupertinoAppData(),
      home: BasicScaffold(title),
    );
  }
}