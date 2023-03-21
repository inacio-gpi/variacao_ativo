import 'package:flutter_test/flutter_test.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/models/active_model.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';

void main() {
  final activeModel = ActiveModel.empty();
  test(
    'should be a subclass of ActiveEntity entity',
    () async {
      expect(activeModel, isA<ActiveEntity>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when receive a valid Map',
      () async {
        final result = ActiveModel.fromMap(mapEmpty);

        expect(result, activeModel);
      },
    );
  });
}
