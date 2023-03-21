import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/app/core/error/failure.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/repositories/i_active_variation_repository.dart';

abstract class IGetActiveVariationUseCase {
  Future<Either<Failure, ActiveEntity>> call(final String activeName);
}

class GetActiveVariationUseCase implements IGetActiveVariationUseCase {
  final IActiveVariationRepository _repository;

  GetActiveVariationUseCase(this._repository);

  @override
  Future<Either<Failure, ActiveEntity>> call(final String activeName) async => await _repository.getActiveVariation(activeName);
}
