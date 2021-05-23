class FcmException implements Exception {
  final String? message;

  FcmException(this.message);
}

class DeviceTokenException extends FcmException {
  final String msg;

  DeviceTokenException(this.msg) : super(msg);

  @override
  String toString() {
    return 'DeviceTokenException{msg: $msg}';
  }
}