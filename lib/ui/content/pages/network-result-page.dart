import 'package:IPv4Calculator/ui/content/pages/network-result.dart';
import 'package:flutter/cupertino.dart';
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
      body: NetworkResult(
        ip: ip,
        subnetMask: subnetMask,
      ),
    );
  }
}
