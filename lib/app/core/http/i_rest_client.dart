import 'package:get/get.dart';

abstract class IRestClient {
  Future<Response> clientGet(
    final String path, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
  });
}
