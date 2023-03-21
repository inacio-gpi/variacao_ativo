import 'dart:convert';

import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/domain/entities/active_entity.dart';

class ActiveModel extends ActiveEntity {
  @override
  final ChartModel chart;
  const ActiveModel({
    required this.chart,
  }) : super(chart: chart);

  Map<String, dynamic> toMap() => {'chart': chart.toMap()};

  factory ActiveModel.empty() => ActiveModel.fromMap(mapEmpty);

  factory ActiveModel.fromMap(final Map<String, dynamic> map) => ActiveModel(
        chart: ChartModel.fromMap(map['chart'] ?? mapEmpty),
      );

  String toJson() => json.encode(toMap());

  factory ActiveModel.fromJson(final String source) => ActiveModel.fromMap(json.decode(source));
}

class ChartModel extends ChartEntity {
  @override
  final List<ResultModel> result;
  const ChartModel({
    required this.result,
  }) : super(result: result);

  Map<String, dynamic> toMap() => {
        'result': result.map((final x) => x.toMap()).toList(),
      };

  factory ChartModel.fromMap(final Map<String, dynamic> map) => ChartModel(
        result: List<ResultModel>.from(map['result']?.map((final x) => ResultModel.fromMap(x)) ?? []),
      );

  String toJson() => json.encode(toMap());

  factory ChartModel.fromJson(final String source) => ChartModel.fromMap(json.decode(source));
}

class ResultModel extends ResultEntity {
  @override
  final MetaModel meta;
  @override
  final List<int> timestamp;
  @override
  final IndicatorsModel indicators;
  const ResultModel({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  }) : super(meta: meta, timestamp: timestamp, indicators: indicators);

  Map<String, dynamic> toMap() => {
        'meta': meta.toMap(),
        'timestamp': timestamp,
        'indicators': indicators.toMap(),
      };

  factory ResultModel.empty() => ResultModel.fromMap(mapEmpty);

  factory ResultModel.fromMap(final Map<String, dynamic> map) => ResultModel(
        meta: MetaModel.fromMap(map['meta'] ?? mapEmpty),
        timestamp: List<int>.from(map['timestamp'] ?? []),
        indicators: IndicatorsModel.fromMap(map['indicators'] ?? mapEmpty),
      );

  String toJson() => json.encode(toMap());

  factory ResultModel.fromJson(final String source) => ResultModel.fromMap(json.decode(source));
}

class MetaModel extends MetaEntity {
  @override
  final String currency;
  @override
  final String symbol;
  @override
  final String exchangeName;
  @override
  final String instrumentType;
  @override
  final int firstTradeDate;
  @override
  final int regularMarketTime;
  @override
  final int gmtoffset;
  @override
  final String timezone;
  @override
  final String exchangeTimezoneName;
  @override
  final double regularMarketPrice;
  @override
  final double chartPreviousClose;
  @override
  final double previousClose;
  @override
  final int scale;
  @override
  final int priceHint;
  @override
  final CurrentTradingPeriodModel currentTradingPeriod;
  @override
  final List<List<TradingPeriodsModel>> tradingPeriods;
  @override
  final String dataGranularity;
  @override
  final String range;
  @override
  final List<String> validRanges;
  const MetaModel({
    required this.currency,
    required this.symbol,
    required this.exchangeName,
    required this.instrumentType,
    required this.firstTradeDate,
    required this.regularMarketTime,
    required this.gmtoffset,
    required this.timezone,
    required this.exchangeTimezoneName,
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    required this.previousClose,
    required this.scale,
    required this.priceHint,
    required this.currentTradingPeriod,
    required this.tradingPeriods,
    required this.dataGranularity,
    required this.range,
    required this.validRanges,
  }) : super(
          currency: currency,
          symbol: symbol,
          exchangeName: exchangeName,
          instrumentType: instrumentType,
          firstTradeDate: firstTradeDate,
          regularMarketTime: regularMarketTime,
          gmtoffset: gmtoffset,
          timezone: timezone,
          exchangeTimezoneName: exchangeTimezoneName,
          regularMarketPrice: regularMarketPrice,
          chartPreviousClose: chartPreviousClose,
          previousClose: previousClose,
          scale: scale,
          priceHint: priceHint,
          currentTradingPeriod: currentTradingPeriod,
          tradingPeriods: tradingPeriods,
          dataGranularity: dataGranularity,
          range: range,
          validRanges: validRanges,
        );

  Map<String, dynamic> toMap() => {
        'currency': currency,
        'symbol': symbol,
        'exchangeName': exchangeName,
        'instrumentType': instrumentType,
        'firstTradeDate': firstTradeDate,
        'regularMarketTime': regularMarketTime,
        'gmtoffset': gmtoffset,
        'timezone': timezone,
        'exchangeTimezoneName': exchangeTimezoneName,
        'regularMarketPrice': regularMarketPrice,
        'chartPreviousClose': chartPreviousClose,
        'previousClose': previousClose,
        'scale': scale,
        'priceHint': priceHint,
        'currentTradingPeriod': currentTradingPeriod.toMap(),
        'tradingPeriods': tradingPeriods.map((final x) => x.map((final e) => e.toMap()).toList()).toList(),
        // 'tradingPeriods': tradingPeriods.map((final x) => x.toMap()).toList(),
        'dataGranularity': dataGranularity,
        'range': range,
        'validRanges': validRanges,
      };

  factory MetaModel.fromMap(final Map<String, dynamic> map) => MetaModel(
        currency: map['currency'] ?? '',
        symbol: map['symbol'] ?? '',
        exchangeName: map['exchangeName'] ?? '',
        instrumentType: map['instrumentType'] ?? '',
        firstTradeDate: map['firstTradeDate']?.toInt() ?? 0,
        regularMarketTime: map['regularMarketTime']?.toInt() ?? 0,
        gmtoffset: map['gmtoffset']?.toInt() ?? 0,
        timezone: map['timezone'] ?? '',
        exchangeTimezoneName: map['exchangeTimezoneName'] ?? '',
        regularMarketPrice: map['regularMarketPrice']?.toDouble() ?? 0.0,
        chartPreviousClose: map['chartPreviousClose']?.toDouble() ?? 0.0,
        previousClose: map['previousClose']?.toDouble() ?? 0.0,
        scale: map['scale']?.toInt() ?? 0,
        priceHint: map['priceHint']?.toInt() ?? 0,
        currentTradingPeriod: CurrentTradingPeriodModel.fromMap(map['currentTradingPeriod'] ?? mapEmpty),
        tradingPeriods: List<List<TradingPeriodsModel>>.from(
          map['tradingPeriods']
                  ?.map(
                    (final x) => x?.map<TradingPeriodsModel>((final y) => TradingPeriodsModel.fromMap(y)).toList() ?? [],
                  )
                  .toList() ??
              [],
        ),
        dataGranularity: map['dataGranularity'] ?? '',
        range: map['range'] ?? '',
        validRanges: List<String>.from(map['validRanges'] ?? []),
      );
  teste() {
    [].map((final e) => e);
  }

  String toJson() => json.encode(toMap());

  factory MetaModel.fromJson(final String source) => MetaModel.fromMap(json.decode(source));
}

class CurrentTradingPeriodModel extends CurrentTradingPeriodEntity {
  @override
  final PreModel pre;
  @override
  final RegularModel regular;
  @override
  final PostModel post;
  const CurrentTradingPeriodModel({
    required this.pre,
    required this.regular,
    required this.post,
  }) : super(pre: pre, regular: regular, post: post);

  Map<String, dynamic> toMap() => {
        'pre': pre.toMap(),
        'regular': regular.toMap(),
        'post': post.toMap(),
      };

  factory CurrentTradingPeriodModel.fromMap(final Map<String, dynamic> map) => CurrentTradingPeriodModel(
        pre: PreModel.fromMap(map['pre'] ?? mapEmpty),
        regular: RegularModel.fromMap(map['regular'] ?? mapEmpty),
        post: PostModel.fromMap(map['post'] ?? mapEmpty),
      );

  String toJson() => json.encode(toMap());

  factory CurrentTradingPeriodModel.fromJson(final String source) => CurrentTradingPeriodModel.fromMap(json.decode(source));
}

class PreModel extends PreEntity {
  @override
  final String timezone;
  @override
  final int end;
  @override
  final int start;
  @override
  final int gmtoffset;
  const PreModel({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  }) : super(timezone: timezone, end: end, start: start, gmtoffset: gmtoffset);

  @override
  PreModel copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      PreModel(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );

  Map<String, dynamic> toMap() => {
        'timezone': timezone,
        'end': end,
        'start': start,
        'gmtoffset': gmtoffset,
      };

  factory PreModel.fromMap(final Map<String, dynamic> map) => PreModel(
        timezone: map['timezone'] ?? '',
        end: map['end']?.toInt() ?? 0,
        start: map['start']?.toInt() ?? 0,
        gmtoffset: map['gmtoffset']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory PreModel.fromJson(final String source) => PreModel.fromMap(json.decode(source));
}

class RegularModel extends RegularEntity {
  @override
  final String timezone;
  @override
  final int end;
  @override
  final int start;
  @override
  final int gmtoffset;
  const RegularModel({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  }) : super(timezone: timezone, end: end, start: start, gmtoffset: gmtoffset);

  @override
  RegularModel copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      RegularModel(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );

  Map<String, dynamic> toMap() => {
        'timezone': timezone,
        'end': end,
        'start': start,
        'gmtoffset': gmtoffset,
      };

  factory RegularModel.fromMap(final Map<String, dynamic> map) => RegularModel(
        timezone: map['timezone'] ?? '',
        end: map['end']?.toInt() ?? 0,
        start: map['start']?.toInt() ?? 0,
        gmtoffset: map['gmtoffset']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory RegularModel.fromJson(final String source) => RegularModel.fromMap(json.decode(source));
}

class PostModel extends PostEntity {
  @override
  final String timezone;
  @override
  final int end;
  @override
  final int start;
  @override
  final int gmtoffset;
  const PostModel({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  }) : super(timezone: timezone, end: end, start: start, gmtoffset: gmtoffset);

  Map<String, dynamic> toMap() => {
        'timezone': timezone,
        'end': end,
        'start': start,
        'gmtoffset': gmtoffset,
      };

  factory PostModel.fromMap(final Map<String, dynamic> map) => PostModel(
        timezone: map['timezone'] ?? '',
        end: map['end']?.toInt() ?? 0,
        start: map['start']?.toInt() ?? 0,
        gmtoffset: map['gmtoffset']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(final String source) => PostModel.fromMap(json.decode(source));
}

class TradingPeriodsModel extends TradingPeriodsEntity {
  @override
  final String timezone;
  @override
  final int end;
  @override
  final int start;
  @override
  final int gmtoffset;
  const TradingPeriodsModel({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  }) : super(timezone: timezone, end: end, start: start, gmtoffset: gmtoffset);

  @override
  TradingPeriodsModel copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      TradingPeriodsModel(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );

  Map<String, dynamic> toMap() => {
        'timezone': timezone,
        'end': end,
        'start': start,
        'gmtoffset': gmtoffset,
      };

  factory TradingPeriodsModel.fromMap(final Map<String, dynamic> map) => TradingPeriodsModel(
        timezone: map['timezone'] ?? '',
        end: map['end']?.toInt() ?? 0,
        start: map['start']?.toInt() ?? 0,
        gmtoffset: map['gmtoffset']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory TradingPeriodsModel.fromJson(final String source) => TradingPeriodsModel.fromMap(json.decode(source));
}

class IndicatorsModel extends IndicatorsEntity {
  @override
  final List<QuoteModel> quote;
  const IndicatorsModel({
    required this.quote,
  }) : super(quote: quote);

  Map<String, dynamic> toMap() => {
        'quote': quote.map((final x) => x.toMap()).toList(),
      };

  factory IndicatorsModel.fromMap(final Map<String, dynamic> map) => IndicatorsModel(
        quote: List<QuoteModel>.from(map['quote']?.map((final x) => QuoteModel.fromMap(x)) ?? []),
      );

  String toJson() => json.encode(toMap());

  factory IndicatorsModel.fromJson(final String source) => IndicatorsModel.fromMap(json.decode(source));
}

class QuoteModel extends QuoteEntity {
  @override
  final List<double> open;
  @override
  final List<double> low;
  @override
  final List<double> high;
  @override
  final List<double> close;
  @override
  final List<int> volume;
  const QuoteModel({
    required this.open,
    required this.low,
    required this.high,
    required this.close,
    required this.volume,
  }) : super(
          open: open,
          low: low,
          high: high,
          close: close,
          volume: volume,
        );

  Map<String, dynamic> toMap() => {
        'open': open,
        'low': low,
        'high': high,
        'close': close,
        'volume': volume,
      };

  factory QuoteModel.fromMap(final Map<String, dynamic> map) => QuoteModel(
        open: List<double>.from(map['open']?.map((final x) => x ?? 0.0) ?? []),
        low: List<double>.from(map['low']?.map((final x) => x ?? 0.0) ?? []),
        high: List<double>.from(map['high']?.map((final x) => x ?? 0.0) ?? []),
        close: List<double>.from(map['close']?.map((final x) => x ?? 0.0) ?? []),
        volume: List<int>.from(map['volume']?.map((final x) => x ?? 0) ?? []),
      );

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(final String source) => QuoteModel.fromMap(json.decode(source));
}
