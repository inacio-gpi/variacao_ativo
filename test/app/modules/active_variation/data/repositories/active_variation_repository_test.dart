import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/datasources/active_variation_datasource.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/models/active_model.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/repositories/active_variation_repository.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/repositories/i_active_variation_repository.dart';

import 'active_variation_repository_test.mocks.dart';

@GenerateMocks([IActiveVariationDataSource])
void main() {
  late MockIActiveVariationDataSource mockDataSource;
  late IActiveVariationRepository repository;

  setUp(() {
    mockDataSource = MockIActiveVariationDataSource();
    repository = ActiveVariationRepository(mockDataSource);
  });

  group(
    'getActiveVariation',
    () {
      final activeModel = ActiveModel.empty();

      test(
        'should return Right(ActiveModel) when the call to remote data source is successful',
        () async {
          // arrange
          when(mockDataSource.getActiveVariation(any)).thenAnswer(
            (final _) async => ActiveModel.empty(),
          );

          final result = await repository.getActiveVariation('');

          expect(result, Right<Failure, ActiveModel>(activeModel));
        },
      );
    },
  );
}
