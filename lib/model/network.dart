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
}
