import 'package:IPv4Calculator/util/ip-util.dart';

class IPAddress {
  String ip;
  int ipAsInt;
  final blocks = List<int>(4);

  IPAddress.fromSubnetMask(int snm) {
    if (snm < 1 || snm > 31) {
      throw FormatException('Subnet part is to small or to big');
    } else {
      String s = '';
      for (int i = 0; i < snm; i++) {
        s += '1';
      }
      s = s.padRight(32, '0');
      final b = new List<String>(4);
      b[0] = s.substring(0, 8);
      b[1] = s.substring(8, 16);
      b[2] = s.substring(16, 24);
      b[3] = s.substring(24, 32);
      blocks[0] = int.parse(b[0], radix: 2);
      blocks[1] = int.parse(b[1], radix: 2);
      blocks[2] = int.parse(b[2], radix: 2);
      blocks[3] = int.parse(b[3], radix: 2);
      ipAsInt = int.parse(s, radix: 2);
      ip = '${blocks[0]}.${blocks[1]}.${blocks[2]}.${blocks[3]}';
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
