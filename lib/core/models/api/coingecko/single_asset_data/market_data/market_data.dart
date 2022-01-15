// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/single_asset_data/common/double_per_currency.dart';
import 'package:yaca/core/models/api/coingecko/single_asset_data/market_data/ath_date.dart';
import 'package:yaca/core/models/api/coingecko/single_asset_data/market_data/atl_date.dart';
import 'package:yaca/core/models/api/coingecko/single_asset_data/market_data/roi.dart';

class MarketData extends Equatable {
  final DoublePerCurrency currentPrice;
  final DoublePerCurrency? totalValueLocked;
  final double? mcapToTvlRatio;
  final double? fdvToTvlRatio;
  final Roi roi;
  final DoublePerCurrency ath;
  final DoublePerCurrency athChangePercentage;
  final AthDate athDate;
  final DoublePerCurrency atl;
  final DoublePerCurrency atlChangePercentage;
  final AtlDate atlDate;
  final DoublePerCurrency marketCap;
  final int? marketCapRank;
  final DoublePerCurrency fullyDilutedValuation;
  final DoublePerCurrency totalVolume;
  final DoublePerCurrency high24h;
  final DoublePerCurrency low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? priceChangePercentage7d;
  final double? priceChangePercentage14d;
  final double? priceChangePercentage30d;
  final double? priceChangePercentage60d;
  final double? priceChangePercentage200d;
  final double? priceChangePercentage1y;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final DoublePerCurrency? priceChange24hInCurrency;
  final DoublePerCurrency? priceChangePercentage1hInCurrency;
  final DoublePerCurrency? priceChangePercentage24hInCurrency;
  final DoublePerCurrency? priceChangePercentage7dInCurrency;
  final DoublePerCurrency? priceChangePercentage14dInCurrency;
  final DoublePerCurrency? priceChangePercentage30dInCurrency;
  final DoublePerCurrency? priceChangePercentage60dInCurrency;
  final DoublePerCurrency? priceChangePercentage200dInCurrency;
  final DoublePerCurrency? priceChangePercentage1yInCurrency;
  final DoublePerCurrency? marketCapChange24hInCurrency;
  final DoublePerCurrency? marketCapChangePercentage24hInCurrency;
  final int? totalSupply;
  final int? maxSupply;
  final int? circulatingSupply;
  final String lastUpdated;
  const MarketData({
    required this.currentPrice,
    required this.totalValueLocked,
    required this.mcapToTvlRatio,
    required this.fdvToTvlRatio,
    required this.roi,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.priceChangePercentage7d,
    required this.priceChangePercentage14d,
    required this.priceChangePercentage30d,
    required this.priceChangePercentage60d,
    required this.priceChangePercentage200d,
    required this.priceChangePercentage1y,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.priceChange24hInCurrency,
    required this.priceChangePercentage1hInCurrency,
    required this.priceChangePercentage24hInCurrency,
    required this.priceChangePercentage7dInCurrency,
    required this.priceChangePercentage14dInCurrency,
    required this.priceChangePercentage30dInCurrency,
    required this.priceChangePercentage60dInCurrency,
    required this.priceChangePercentage200dInCurrency,
    required this.priceChangePercentage1yInCurrency,
    required this.marketCapChange24hInCurrency,
    required this.marketCapChangePercentage24hInCurrency,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.lastUpdated,
  });

  MarketData copyWith({
    DoublePerCurrency? currentPrice,
    DoublePerCurrency? totalValueLocked,
    double? mcapToTvlRatio,
    double? fdvToTvlRatio,
    Roi? roi,
    DoublePerCurrency? ath,
    DoublePerCurrency? athChangePercentage,
    AthDate? athDate,
    DoublePerCurrency? atl,
    DoublePerCurrency? atlChangePercentage,
    AtlDate? atlDate,
    DoublePerCurrency? marketCap,
    int? marketCapRank,
    DoublePerCurrency? fullyDilutedValuation,
    DoublePerCurrency? totalVolume,
    DoublePerCurrency? high24h,
    DoublePerCurrency? low24h,
    double? priceChange24h,
    double? priceChangePercentage24h,
    double? priceChangePercentage7d,
    double? priceChangePercentage14d,
    double? priceChangePercentage30d,
    double? priceChangePercentage60d,
    double? priceChangePercentage200d,
    double? priceChangePercentage1y,
    double? marketCapChange24h,
    double? marketCapChangePercentage24h,
    DoublePerCurrency? priceChange24hInCurrency,
    DoublePerCurrency? priceChangePercentage1hInCurrency,
    DoublePerCurrency? priceChangePercentage24hInCurrency,
    DoublePerCurrency? priceChangePercentage7dInCurrency,
    DoublePerCurrency? priceChangePercentage14dInCurrency,
    DoublePerCurrency? priceChangePercentage30dInCurrency,
    DoublePerCurrency? priceChangePercentage60dInCurrency,
    DoublePerCurrency? priceChangePercentage200dInCurrency,
    DoublePerCurrency? priceChangePercentage1yInCurrency,
    DoublePerCurrency? marketCapChange24hInCurrency,
    DoublePerCurrency? marketCapChangePercentage24hInCurrency,
    int? totalSupply,
    int? maxSupply,
    int? circulatingSupply,
    String? lastUpdated,
  }) {
    return MarketData(
      currentPrice: currentPrice ?? this.currentPrice,
      totalValueLocked: totalValueLocked ?? this.totalValueLocked,
      mcapToTvlRatio: mcapToTvlRatio ?? this.mcapToTvlRatio,
      fdvToTvlRatio: fdvToTvlRatio ?? this.fdvToTvlRatio,
      roi: roi ?? this.roi,
      ath: ath ?? this.ath,
      athChangePercentage: athChangePercentage ?? this.athChangePercentage,
      athDate: athDate ?? this.athDate,
      atl: atl ?? this.atl,
      atlChangePercentage: atlChangePercentage ?? this.atlChangePercentage,
      atlDate: atlDate ?? this.atlDate,
      marketCap: marketCap ?? this.marketCap,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      fullyDilutedValuation:
          fullyDilutedValuation ?? this.fullyDilutedValuation,
      totalVolume: totalVolume ?? this.totalVolume,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      priceChange24h: priceChange24h ?? this.priceChange24h,
      priceChangePercentage24h:
          priceChangePercentage24h ?? this.priceChangePercentage24h,
      priceChangePercentage7d:
          priceChangePercentage7d ?? this.priceChangePercentage7d,
      priceChangePercentage14d:
          priceChangePercentage14d ?? this.priceChangePercentage14d,
      priceChangePercentage30d:
          priceChangePercentage30d ?? this.priceChangePercentage30d,
      priceChangePercentage60d:
          priceChangePercentage60d ?? this.priceChangePercentage60d,
      priceChangePercentage200d:
          priceChangePercentage200d ?? this.priceChangePercentage200d,
      priceChangePercentage1y:
          priceChangePercentage1y ?? this.priceChangePercentage1y,
      marketCapChange24h: marketCapChange24h ?? this.marketCapChange24h,
      marketCapChangePercentage24h:
          marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
      priceChange24hInCurrency:
          priceChange24hInCurrency ?? this.priceChange24hInCurrency,
      priceChangePercentage1hInCurrency: priceChangePercentage1hInCurrency ??
          this.priceChangePercentage1hInCurrency,
      priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency ??
          this.priceChangePercentage24hInCurrency,
      priceChangePercentage7dInCurrency: priceChangePercentage7dInCurrency ??
          this.priceChangePercentage7dInCurrency,
      priceChangePercentage14dInCurrency: priceChangePercentage14dInCurrency ??
          this.priceChangePercentage14dInCurrency,
      priceChangePercentage30dInCurrency: priceChangePercentage30dInCurrency ??
          this.priceChangePercentage30dInCurrency,
      priceChangePercentage60dInCurrency: priceChangePercentage60dInCurrency ??
          this.priceChangePercentage60dInCurrency,
      priceChangePercentage200dInCurrency:
          priceChangePercentage200dInCurrency ??
              this.priceChangePercentage200dInCurrency,
      priceChangePercentage1yInCurrency: priceChangePercentage1yInCurrency ??
          this.priceChangePercentage1yInCurrency,
      marketCapChange24hInCurrency:
          marketCapChange24hInCurrency ?? this.marketCapChange24hInCurrency,
      marketCapChangePercentage24hInCurrency:
          marketCapChangePercentage24hInCurrency ??
              this.marketCapChangePercentage24hInCurrency,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_price': currentPrice.toMap(),
      'total_value_locked': totalValueLocked,
      'mcap_to_tvl_ratio': mcapToTvlRatio,
      'fdv_to_tvl_ratio': fdvToTvlRatio,
      'roi': roi.toMap(),
      'ath': ath.toMap(),
      'ath_change_percentage': athChangePercentage.toMap(),
      'ath_date': athDate.toMap(),
      'atl': atl.toMap(),
      'atl_change_percentage': atlChangePercentage.toMap(),
      'atl_date': atlDate.toMap(),
      'market_cap': marketCap.toMap(),
      'market_cap_rank': marketCapRank,
      'fully_diluted_valuation': fullyDilutedValuation.toMap(),
      'total_volume': totalVolume.toMap(),
      'high_24h': high24h.toMap(),
      'low_24h': low24h.toMap(),
      'price_change_24h': priceChange24h,
      'price_change_percentage_24h': priceChangePercentage24h,
      'price_change_percentage_7d': priceChangePercentage7d,
      'price_change_percentage_14d': priceChangePercentage14d,
      'price_change_percentage_30d': priceChangePercentage30d,
      'price_change_percentage_60d': priceChangePercentage60d,
      'price_change_percentage_200d': priceChangePercentage200d,
      'price_change_percentage_1y': priceChangePercentage1y,
      'market_cap_change_24h': marketCapChange24h,
      'market_cap_change_percentage_24h': marketCapChangePercentage24h,
      'price_change_24h_in_currency': priceChange24hInCurrency?.toMap(),
      'price_change_percentage_1h_in_currency':
          priceChangePercentage1hInCurrency?.toMap(),
      'price_change_percentage_24h_in_currency':
          priceChangePercentage24hInCurrency?.toMap(),
      'price_change_percentage_7d_in_currency':
          priceChangePercentage7dInCurrency?.toMap(),
      'price_change_percentage_14d_in_currency':
          priceChangePercentage14dInCurrency?.toMap(),
      'price_change_percentage_30d_in_currency':
          priceChangePercentage30dInCurrency?.toMap(),
      'price_change_percentage_60d_in_currency':
          priceChangePercentage60dInCurrency?.toMap(),
      'price_change_percentage_200d_in_currency':
          priceChangePercentage200dInCurrency?.toMap(),
      'price_change_percentage_1y_in_currency':
          priceChangePercentage1yInCurrency?.toMap(),
      'market_cap_change_24h_in_currency':
          marketCapChange24hInCurrency?.toMap(),
      'market_cap_change_percentage_24h_in_currency':
          marketCapChangePercentage24hInCurrency?.toMap(),
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'circulating_supply': circulatingSupply,
      'last_updated': lastUpdated,
    };
  }

  factory MarketData.fromMap(Map<String, dynamic> map) {
    return MarketData(
      currentPrice: DoublePerCurrency.fromMap(map['current_price']),
      totalValueLocked: map['total_value_locked'] != null
          ? DoublePerCurrency.fromMap(map['total_value_locked'])
          : null,
      mcapToTvlRatio: map['mcap_to_tvl_ratio'],
      fdvToTvlRatio:
          map['fdv_to_tvl_ratio'] != null && map['fdv_to_tvl_ratio'] == '?'
              ? null
              : map['fdv_to_tvl_ratio'],
      roi: Roi.fromMap(map['roi']),
      ath: DoublePerCurrency.fromMap(map['ath']),
      athChangePercentage:
          DoublePerCurrency.fromMap(map['ath_change_percentage']),
      athDate: AthDate.fromMap(map['ath_date']),
      atl: DoublePerCurrency.fromMap(map['atl']),
      atlChangePercentage:
          DoublePerCurrency.fromMap(map['atl_change_percentage']),
      atlDate: AtlDate.fromMap(map['atl_date']),
      marketCap: DoublePerCurrency.fromMap(map['market_cap']),
      marketCapRank: map['market_cap_rank']?.toInt(),
      fullyDilutedValuation:
          DoublePerCurrency.fromMap(map['fully_diluted_valuation']),
      totalVolume: DoublePerCurrency.fromMap(map['total_volume']),
      high24h: DoublePerCurrency.fromMap(map['high_24h']),
      low24h: DoublePerCurrency.fromMap(map['low_24h']),
      priceChange24h: map['price_change_24h']?.toDouble(),
      priceChangePercentage24h: map['price_change_percentage_24h']?.toDouble(),
      priceChangePercentage7d: map['price_change_percentage_7d']?.toDouble(),
      priceChangePercentage14d: map['price_change_percentage_14d']?.toDouble(),
      priceChangePercentage30d: map['price_change_percentage_30d']?.toDouble(),
      priceChangePercentage60d: map['price_change_percentage_60d']?.toDouble(),
      priceChangePercentage200d:
          map['price_change_percentage_200d']?.toDouble(),
      priceChangePercentage1y: map['price_change_percentage_1y']?.toDouble(),
      marketCapChange24h: map['market_cap_change_24h']?.toDouble(),
      marketCapChangePercentage24h:
          map['market_cap_change_percentage_24h']?.toDouble(),
      priceChange24hInCurrency: map['price_change_24h_in_currency'] != null
          ? DoublePerCurrency.fromMap(map['price_change_24h_in_currency'])
          : null,
      priceChangePercentage1hInCurrency:
          map['price_change_percentage_1h_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_1h_in_currency'])
              : null,
      priceChangePercentage24hInCurrency:
          map['price_change_percentage_24h_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_24h_in_currency'])
              : null,
      priceChangePercentage7dInCurrency:
          map['price_change_percentage_7d_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_7d_in_currency'])
              : null,
      priceChangePercentage14dInCurrency:
          map['price_change_percentage_14d_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_14d_in_currency'])
              : null,
      priceChangePercentage30dInCurrency:
          map['price_change_percentage_30d_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_30d_in_currency'])
              : null,
      priceChangePercentage60dInCurrency:
          map['price_change_percentage_60d_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_60d_in_currency'])
              : null,
      priceChangePercentage200dInCurrency: DoublePerCurrency.fromMap(
          map['price_change_percentage_200d_in_currency']),
      priceChangePercentage1yInCurrency:
          map['price_change_percentage_1y_in_currency'] != null
              ? DoublePerCurrency.fromMap(
                  map['price_change_percentage_1y_in_currency'])
              : null,
      marketCapChange24hInCurrency:
          DoublePerCurrency.fromMap(map['market_cap_change_24h_in_currency']),
      marketCapChangePercentage24hInCurrency: DoublePerCurrency.fromMap(
          map['market_cap_change_percentage_24h_in_currency']),
      totalSupply: map['total_supply']?.toInt(),
      maxSupply: map['max_supply']?.toInt(),
      circulatingSupply: map['circulating_supply']?.toInt(),
      lastUpdated: map['last_updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source) =>
      MarketData.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currentPrice,
      totalValueLocked,
      mcapToTvlRatio,
      fdvToTvlRatio,
      roi,
      ath,
      athChangePercentage,
      athDate,
      atl,
      atlChangePercentage,
      atlDate,
      marketCap,
      marketCapRank,
      fullyDilutedValuation,
      totalVolume,
      high24h,
      low24h,
      priceChange24h,
      priceChangePercentage24h,
      priceChangePercentage7d,
      priceChangePercentage14d,
      priceChangePercentage30d,
      priceChangePercentage60d,
      priceChangePercentage200d,
      priceChangePercentage1y,
      marketCapChange24h,
      marketCapChangePercentage24h,
      priceChange24hInCurrency,
      priceChangePercentage1hInCurrency,
      priceChangePercentage24hInCurrency,
      priceChangePercentage7dInCurrency,
      priceChangePercentage14dInCurrency,
      priceChangePercentage30dInCurrency,
      priceChangePercentage60dInCurrency,
      priceChangePercentage200dInCurrency,
      priceChangePercentage1yInCurrency,
      marketCapChange24hInCurrency,
      marketCapChangePercentage24hInCurrency,
      totalSupply,
      maxSupply,
      circulatingSupply,
      lastUpdated,
    ];
  }
}

