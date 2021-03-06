import 'package:IPv4Calculator/util/ip-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BaseContent extends StatefulWidget {
  @override
  _BaseContentState createState() => _BaseContentState();
}

class _BaseContentState extends State<BaseContent> {
  String ip = '';
  int subnetMaskSize = 24;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please enter an IP address and a subnet mask to calculate network details',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformTextField(
                material: (_, __) => MaterialTextFieldData(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: 'IP Address',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'IP Address',
                ),
                onChanged: (String ip) {
                  this.ip = ip;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformTextField(
                material: (_, __) => MaterialTextFieldData(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Subnet mask (short)',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Subnet mask (short)',
                  keyboardType: TextInputType.number,
                ),
                onChanged: (String snm) {
                  try {
                    this.subnetMaskSize = int.parse(snm);
                  } catch (FormatException) {}
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                child: PlatformText('Calculate'),
                cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
                onPressed: () => calculateAndShow(context),
              ),
            )
          ],
        );
      },
    );
  }

  void showErrorDialog() {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text('Invalid data entered'),
        content: Text(
          'IP address is ${IpUtil.verifyIp(ip) ? "valid" : "invalid"} \n' +
              'Subnet mask is ${subnetMaskSize > 0 && subnetMaskSize < 31 ? "valid" : "invalid"}',
        ),
        actions: <Widget>[
          PlatformDialogAction(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void calculateAndShow(final BuildContext context) {
    if (subnetMaskSize < 0 || subnetMaskSize > 31 || !IpUtil.verifyIp(ip)) {
      showErrorDialog();
      return;
    }
    Navigator.of(context).pushNamed('/networkResult',
        arguments: {'ip': ip, 'subnetMask': subnetMaskSize});
  }
}
