import 'package:santaclothes/data/common/sancle_error.dart';

class DeviceTokenException extends SancleException {
  final String msg;

  DeviceTokenException(this.msg) : super(msg);

  @override
  String toString() {
    return 'DeviceTokenException{msg: $msg}';
  }
}