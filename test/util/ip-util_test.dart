import 'package:IPv4Calculator/util/ip-util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be false on random string', () {
    final text = 'invalid';

    final result = IpUtil.verifyIp(text);

    expect(result, false);
  });

  test('should be false on invalid ip', () {
    final text = '192.168.1.666';

    final result = IpUtil.verifyIp(text);

    expect(result, false);
  });

  test('should return true on valid ip', () {
    final text = '192.168.1.254';

    final result = IpUtil.verifyIp(text);

    expect(result, true);
  });
}
