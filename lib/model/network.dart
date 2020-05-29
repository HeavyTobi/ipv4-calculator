import 'package:IPv4Calculator/model/ip-address.dart';

class Network {
  IPAddress netId;
  IPAddress firstHost;
  IPAddress lastHost;
  IPAddress broadcast;
  IPAddress subnetMask;

  Network(
      {this.netId,
      this.firstHost,
      this.lastHost,
      this.broadcast,
      this.subnetMask});

  Network.fromIPAndSubnet(final String ip, final int subnetMask) {
    // TODO: implement
    this.subnetMask = IPAddress.fromSubnetMask(subnetMask);
    final IPAddress ipAddress = IPAddress.fromIP(ip);
    netId = IPAddress.fromNumber(ipAddress.ipAsInt & this.subnetMask.ipAsInt);
    firstHost = IPAddress.fromNumber(netId.ipAsInt + 1);
    String reversedSubnetMask = this
        .subnetMask
        .ipAsInt
        .toRadixString(2)
        .replaceAll('1', '2')
        .replaceAll('0', '1')
        .replaceAll('2', '0');
    broadcast = IPAddress.fromNumber(
      ipAddress.ipAsInt | int.parse(reversedSubnetMask, radix: 2),
    );
    lastHost = IPAddress.fromNumber(broadcast.ipAsInt - 1);
  }
}
