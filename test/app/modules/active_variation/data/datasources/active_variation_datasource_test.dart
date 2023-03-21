import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/active_variation.dart';

import 'active_variation_datasource_test.mocks.dart';

@GenerateMocks([IRestClient])
void main() {
  late MockIRestClient mockHttp;
  late IActiveVariationDataSource dataSource;

  setUpAll(() {
    mockHttp = MockIRestClient();
    dataSource = ActiveVariationDataSource(mockHttp);
  });

  group(
    'getActiveVariation',
    () {
      test(
        'should return ActiveModel when the response.body is != null (success)',
        () async {
          when(mockHttp.clientGet(any)).thenAnswer(
            (final _) async => const Response(body: mapEmpty, statusCode: 200),
          );

          final result = await dataSource.getActiveVariation('any');

          expect(result, isA<ActiveModel>());
        },
      );
      test(
        'should return an Failure when restClient return NetworkException',
        () async {
          when(mockHttp.clientGet(any)).thenAnswer(
            (final _) async => throw NetworkException(message: 'Erro ao obter dados da API'),
          );

          expect(
            () async => await dataSource.getActiveVariation('any'),
            throwsA(isA<Failure>()),
          );
        },
      );
    },
  );
}
