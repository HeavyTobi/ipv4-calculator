import 'package:IPv4Calculator/util/os-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'content/base-content.dart';

class BasicScaffold extends StatelessWidget {
  BasicScaffold(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: OsUtil.isMacOrIOS()
          ? CupertinoTheme.of(context).textTheme.textStyle
          : Theme.of(context).textTheme.bodyText1,
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(title),
        ),
        iosContentPadding: false,
        body: BaseContent(),
      ),
    );
  }
}
