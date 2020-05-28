import 'package:IPv4Calculator/util/ip-util.dart';

class IPAddress {
  String ip;
  final blocks = List<int>(4);

  IPAddress.fromSubnetMask(int snm) {
    if (snm < 1 || snm > 31) {
      throw FormatException('Subnet part is to small or to big');
    } else {
      final s = snm.toRadixString(2);
      final b = new List<String>(4);
      b[0] = s.substring(0, 7);
      b[1] = s.substring(8, 15);
      b[2] = s.substring(16, 23);
      b[3] = s.substring(24, 31);
    }
  }

  IPAddress.fromIP(this.ip) {
    if (IpUtil.verifyIp(ip)) {
      final ipBlocks = ip.split('.');
      for (int i = 0; i < 4; i++) {
        blocks[i] = int.parse(ipBlocks[i]);
      }
    } else {
      throw FormatException('IP Address is in wrong format');
    }
  }
}
