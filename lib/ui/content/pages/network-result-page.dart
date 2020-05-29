import 'package:IPv4Calculator/ui/content/pages/network-result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NetworkResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final String ip = routeArgs['ip'];
    final int subnetMask = routeArgs['subnetMask'];

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Network for $ip/$subnetMask'),
      ),
      iosContentPadding: false,
      // SafeArea is required here, otherwise the content will hide behind the nav bar
      body: SafeArea(
        child: NetworkResult(
          ip: ip,
          subnetMask: subnetMask,
        ),
      ),
    );
  }
}
