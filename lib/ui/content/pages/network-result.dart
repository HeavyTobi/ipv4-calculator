import 'package:IPv4Calculator/model/network.dart';
import 'package:IPv4Calculator/ui/content/pages/ip-widget.dart';
import 'package:flutter/material.dart';

class NetworkResult extends StatefulWidget {
  final String ip;
  final int subnetMask;

  NetworkResult({
    @required this.ip,
    @required this.subnetMask,
  });

  @override
  _NetworkResultState createState() =>
      _NetworkResultState(Network.fromIPAndSubnet(ip, subnetMask));
}

class _NetworkResultState extends State<NetworkResult> {
  Network network;

  _NetworkResultState(this.network);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints viewportConstraints,
      ) {
        return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                IPWidget(
                  name: 'Network ID',
                  ipAddress: network.netId,
                ),
                IPWidget(
                  name: 'Subnet mask',
                  ipAddress: network.subnetMask,
                ),
                IPWidget(
                  name: 'First host',
                  ipAddress: network.firstHost,
                ),
                IPWidget(
                  name: 'Last host',
                  ipAddress: network.lastHost,
                ),
                IPWidget(
                  name: 'Broadcast',
                  ipAddress: network.broadcast,
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
