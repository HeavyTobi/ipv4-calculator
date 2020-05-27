import 'dart:io';

class OsUtil {
  static bool isMacOrIOS() => Platform.isIOS || Platform.isMacOS;
}
