import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/app/core/error/failure.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';

abstract class IActiveVariationRepository {
  Future<Either<Failure, ActiveEntity>> getActiveVariation(final String activeName);
}
