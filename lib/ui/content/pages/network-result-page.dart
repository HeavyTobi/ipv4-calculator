import 'package:IPv4Calculator/ui/content/pages/network-result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NetworkResultPage extends StatelessWidget {
  final String ip;
  final int subnetMask;

  get ipComplete => '$ip/$subnetMask';

  NetworkResultPage({
    @required this.ip,
    @required this.subnetMask,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Network for $ipComplete'),
      ),
      body: NetworkResult(
        ip: ip,
        subnetMask: subnetMask,
      ),
    );
  }
}
