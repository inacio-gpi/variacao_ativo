import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/app/core/error/failure.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/datasources/active_variation_datasource.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/repositories/i_active_variation_repository.dart';

class ActiveVariationRepository extends IActiveVariationRepository {
  final IActiveVariationDataSource _dataSource;

  ActiveVariationRepository(this._dataSource);

  @override
  Future<Either<Failure, ActiveEntity>> getActiveVariation(final String activeName) async {
    try {
      final result = await _dataSource.getActiveVariation(activeName);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
