import 'package:IPv4Calculator/model/ip-address.dart';
import 'package:IPv4Calculator/util/text-theme-util.dart';
import 'package:flutter/widgets.dart';

class IPWidget extends StatelessWidget {
  final String name;
  final IPAddress ipAddress;

  IPWidget({
    @required this.name,
    @required this.ipAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: PlatformTextTheme.of(context).h4,
        ),
        Text(
          ipAddress.ip,
          style: PlatformTextTheme.of(context).blockBig,
        ),
        Text(
          '${ipAddress.blocks[0].toRadixString(2).padLeft(8, '0')}.'
          '${ipAddress.blocks[1].toRadixString(2).padLeft(8, '0')}.'
          '${ipAddress.blocks[2].toRadixString(2).padLeft(8, '0')}.'
          '${ipAddress.blocks[3].toRadixString(2).padLeft(8, '0')}',
          style: PlatformTextTheme.of(context).block,
        ),
      ],
    );
  }
}
