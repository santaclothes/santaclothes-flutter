class SancleException implements Exception {
  final String? message;

  SancleException(this.message);
}

class SancleClientException extends SancleException {
  final String msg;

  SancleClientException(this.msg) : super(msg);

  @override
  String toString() {
    return 'SancleClientException{msg: $msg}';
  }
}

class SancleApiException extends SancleException {
  final String path;
  final String msg;
  final String? title;
  final int? status;

  SancleApiException(this.path, this.msg, this.title, this.status) : super(msg);

  SancleApiException.fromJson(
      String path, String msg, Map<String, dynamic> json)
      : path = path,
        msg = msg,
        title = json['title'],
        status = json['status'],
        super(msg);

  @override
  String toString() {
    return 'SancleApiException{path: $path, msg: $msg, title: $title, status: $status}';
  }
}
