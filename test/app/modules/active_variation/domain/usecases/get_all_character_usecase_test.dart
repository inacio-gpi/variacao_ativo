import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/app/core/error/failure.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/models/active_model.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/repositories/i_active_variation_repository.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/usecases/get_all_character_usecase.dart';

import 'get_all_character_usecase_test.mocks.dart';

@GenerateMocks([IActiveVariationRepository])
void main() {
  late IActiveVariationRepository mockRepository;
  late IGetActiveVariationUseCase useCase;

  setUp(() {
    mockRepository = MockIActiveVariationRepository();
    useCase = GetActiveVariationUseCase(mockRepository);
  });

  final activeModel = ActiveModel.empty();
  group('getActiveVariation', () {
    test(
      'should get ActiveEntity from the repository',
      () async {
        when(mockRepository.getActiveVariation('')).thenAnswer(
          (final _) async => Right(activeModel),
        );

        final result = await useCase('');
        expect(result, Right<Failure, ActiveEntity>(activeModel));
        expect(result, isA<Right<Failure, ActiveEntity>>());
      },
    );
  });
}
