import 'package:equatable/equatable.dart';

class ActiveEntity extends Equatable {
  final ChartEntity chart;
  const ActiveEntity({
    required this.chart,
  });

  ActiveEntity copyWith({
    final ChartEntity? chart,
  }) =>
      ActiveEntity(
        chart: chart ?? this.chart,
      );

  @override
  List<Object?> get props => [chart];
}

class ChartEntity extends Equatable {
  final List<ResultEntity> result;
  const ChartEntity({
    required this.result,
  });

  ChartEntity copyWith({
    final List<ResultEntity>? result,
  }) =>
      ChartEntity(
        result: result ?? this.result,
      );
  @override
  List<Object?> get props => [result];
}

class ResultEntity extends Equatable {
  final MetaEntity meta;
  final List<int> timestamp;
  final IndicatorsEntity indicators;
  const ResultEntity({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  });

  ResultEntity copyWith({
    final MetaEntity? meta,
    final List<int>? timestamp,
    final IndicatorsEntity? indicators,
  }) =>
      ResultEntity(
        meta: meta ?? this.meta,
        timestamp: timestamp ?? this.timestamp,
        indicators: indicators ?? this.indicators,
      );
  @override
  List<Object?> get props => [meta, timestamp, indicators];
}

class MetaEntity extends Equatable {
  final String currency;
  final String symbol;
  final String exchangeName;
  final String instrumentType;
  final int firstTradeDate;
  final int regularMarketTime;
  final int gmtoffset;
  final String timezone;
  final String exchangeTimezoneName;
  final double regularMarketPrice;
  final double chartPreviousClose;
  final double previousClose;
  final int scale;
  final int priceHint;
  final CurrentTradingPeriodEntity currentTradingPeriod;
  final List<List<TradingPeriodsEntity>> tradingPeriods;
  final String dataGranularity;
  final String range;
  final List<String> validRanges;
  const MetaEntity({
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
  });

  MetaEntity copyWith({
    final String? currency,
    final String? symbol,
    final String? exchangeName,
    final String? instrumentType,
    final int? firstTradeDate,
    final int? regularMarketTime,
    final int? gmtoffset,
    final String? timezone,
    final String? exchangeTimezoneName,
    final double? regularMarketPrice,
    final double? chartPreviousClose,
    final double? previousClose,
    final int? scale,
    final int? priceHint,
    final CurrentTradingPeriodEntity? currentTradingPeriod,
    final List<List<TradingPeriodsEntity>>? tradingPeriods,
    final String? dataGranularity,
    final String? range,
    final List<String>? validRanges,
  }) =>
      MetaEntity(
        currency: currency ?? this.currency,
        symbol: symbol ?? this.symbol,
        exchangeName: exchangeName ?? this.exchangeName,
        instrumentType: instrumentType ?? this.instrumentType,
        firstTradeDate: firstTradeDate ?? this.firstTradeDate,
        regularMarketTime: regularMarketTime ?? this.regularMarketTime,
        gmtoffset: gmtoffset ?? this.gmtoffset,
        timezone: timezone ?? this.timezone,
        exchangeTimezoneName: exchangeTimezoneName ?? this.exchangeTimezoneName,
        regularMarketPrice: regularMarketPrice ?? this.regularMarketPrice,
        chartPreviousClose: chartPreviousClose ?? this.chartPreviousClose,
        previousClose: previousClose ?? this.previousClose,
        scale: scale ?? this.scale,
        priceHint: priceHint ?? this.priceHint,
        currentTradingPeriod: currentTradingPeriod ?? this.currentTradingPeriod,
        tradingPeriods: tradingPeriods ?? this.tradingPeriods,
        dataGranularity: dataGranularity ?? this.dataGranularity,
        range: range ?? this.range,
        validRanges: validRanges ?? this.validRanges,
      );
  @override
  List<Object?> get props => [
        currency,
        symbol,
        exchangeName,
        instrumentType,
        firstTradeDate,
        regularMarketTime,
        gmtoffset,
        timezone,
        exchangeTimezoneName,
        regularMarketPrice,
        chartPreviousClose,
        previousClose,
        scale,
        priceHint,
        currentTradingPeriod,
        tradingPeriods,
        dataGranularity,
        range,
        validRanges,
      ];
}

class CurrentTradingPeriodEntity extends Equatable {
  final PreEntity pre;
  final RegularEntity regular;
  final PostEntity post;
  const CurrentTradingPeriodEntity({
    required this.pre,
    required this.regular,
    required this.post,
  });

  CurrentTradingPeriodEntity copyWith({
    final PreEntity? pre,
    final RegularEntity? regular,
    final PostEntity? post,
  }) =>
      CurrentTradingPeriodEntity(
        pre: pre ?? this.pre,
        regular: regular ?? this.regular,
        post: post ?? this.post,
      );
  @override
  List<Object?> get props => [pre, regular, post];
}

class PreEntity extends Equatable {
  final String timezone;
  final int end;
  final int start;
  final int gmtoffset;
  const PreEntity({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  });

  PreEntity copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      PreEntity(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );
  @override
  List<Object?> get props => [timezone, end, start, gmtoffset];
}

class RegularEntity extends Equatable {
  final String timezone;
  final int end;
  final int start;
  final int gmtoffset;
  const RegularEntity({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  });

  RegularEntity copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      RegularEntity(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );
  @override
  List<Object?> get props => [timezone, end, start, gmtoffset];
}

class PostEntity extends Equatable {
  final String timezone;
  final int end;
  final int start;
  final int gmtoffset;
  const PostEntity({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  });

  PostEntity copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      PostEntity(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );
  @override
  List<Object?> get props => [timezone, end, start, gmtoffset];
}

class TradingPeriodsEntity extends Equatable {
  final String timezone;
  final int end;
  final int start;
  final int gmtoffset;
  const TradingPeriodsEntity({
    required this.timezone,
    required this.end,
    required this.start,
    required this.gmtoffset,
  });

  TradingPeriodsEntity copyWith({
    final String? timezone,
    final int? end,
    final int? start,
    final int? gmtoffset,
  }) =>
      TradingPeriodsEntity(
        timezone: timezone ?? this.timezone,
        end: end ?? this.end,
        start: start ?? this.start,
        gmtoffset: gmtoffset ?? this.gmtoffset,
      );
  @override
  List<Object?> get props => [timezone, end, start, gmtoffset];
}

class IndicatorsEntity extends Equatable {
  final List<QuoteEntity> quote;
  const IndicatorsEntity({
    required this.quote,
  });

  IndicatorsEntity copyWith({
    final List<QuoteEntity>? quote,
  }) =>
      IndicatorsEntity(
        quote: quote ?? this.quote,
      );
  @override
  List<Object?> get props => [quote];
}

class QuoteEntity extends Equatable {
  final List<double> open;
  final List<double> low;
  final List<double> high;
  final List<double> close;
  final List<int> volume;
  const QuoteEntity({
    required this.open,
    required this.low,
    required this.high,
    required this.close,
    required this.volume,
  });

  QuoteEntity copyWith({
    final List<double>? open,
    final List<double>? low,
    final List<double>? high,
    final List<double>? close,
    final List<int>? volume,
  }) =>
      QuoteEntity(
        open: open ?? this.open,
        low: low ?? this.low,
        high: high ?? this.high,
        close: close ?? this.close,
        volume: volume ?? this.volume,
      );
  @override
  List<Object?> get props => [open, low, high, close, volume];
}
