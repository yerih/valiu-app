

class Result<T> {
  final bool isSuccess;
  final bool isError;
  String? message;
  final T? data;

  Result({this.data, this.message}) : isSuccess = data != null, isError = data == null;

}



