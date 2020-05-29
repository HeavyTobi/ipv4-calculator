import 'package:flutter/material.dart';

class NetworkResult extends StatelessWidget {
  final String ip;
  final int subnetMask;

  NetworkResult({
    @required this.ip,
    @required this.subnetMask,
  });

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
            child: Row(
              children: <Widget>[
                Text(
                  'Network ID: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ]);
      },
    );
  }
}
