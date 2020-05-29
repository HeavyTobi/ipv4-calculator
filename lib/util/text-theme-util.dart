import 'package:IPv4Calculator/util/os-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextTheme {
  final BuildContext context;

  get h4 => OsUtil.isMacOrIOS()
      ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 28)
      : Theme.of(context).textTheme.headline4;

  get blockBig => OsUtil.isMacOrIOS()
      ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Mono',
            fontSize: 32,
          )
      : Theme.of(context).textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Mono',
            fontSize: 32,
          );

  get block => OsUtil.isMacOrIOS()
      ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontFamily: 'Mono',
            fontSize: 12,
          )
      : Theme.of(context).textTheme.bodyText1.copyWith(
            fontFamily: 'Mono',
            fontSize: 12,
          );

  PlatformTextTheme.of(this.context);
}
