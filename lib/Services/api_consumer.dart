abstract class APIConsumer {
  Future<dynamic> getData(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
