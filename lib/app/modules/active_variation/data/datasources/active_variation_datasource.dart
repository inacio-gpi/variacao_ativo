import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/data/models/active_model.dart';

abstract class IActiveVariationDataSource {
  Future<ActiveModel> getActiveVariation(final String activeName);
}

class ActiveVariationDataSource extends IActiveVariationDataSource {
  final IRestClient _restClient;

  ActiveVariationDataSource(this._restClient);

  @override
  Future<ActiveModel> getActiveVariation(final String activeName) async {
    final response = await _restClient.clientGet('https://query2.finance.yahoo.com/v8/finance/chart/$activeName');
    if (response.body != null) {
      return ActiveModel.fromMap(response.body);
    }
    throw DataSourceException(message: 'Erro no retorno da API');
  }
}
