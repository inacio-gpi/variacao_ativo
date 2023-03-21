import 'package:get/get_connect/connect.dart';
import 'package:variacao_ativo/app/core/core.dart';

class RestClient extends GetConnect implements IRestClient {
  @override
  Future<Response> clientGet(
    final String path, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await get(
        path,
        query: queryParameters,
        headers: headers,
      );
      return response;
    } catch (error, stackTrace) {
      throw NetworkException(message: 'Erro ao obter dados da API', stackTrace: stackTrace);
    }
  }
}
