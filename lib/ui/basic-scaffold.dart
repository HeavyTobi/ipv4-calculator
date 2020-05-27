import 'dart:io';

import 'package:IPv4Calculator/content/base-content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatelessWidget {
  BasicScaffold({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
            ),
            child: BaseContent(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('IPv4 Calculator'),
            ),
            body: BaseContent(),
          );
  }
}
