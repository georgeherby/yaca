// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class SingleAssetData extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final int block_time_in_minutes;
  final String? hashing_algorithm;
  final List<String> categories;
  final List<String?> additional_notices;
  final Localization localization;
  final Description description;
  final Links links;
  final Image image;
  final String country_origin;
  final String? genesis_date;
  final double sentimentVotesUpPercentage;
  final double sentimentVotesDownPercentage;
  final int marketCapRank;
  final int coingeckoRank;
  final double coingeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final MarketData marketData;
  final CommunityData community_data;
  final DeveloperData developer_data;
  final PublicInterestStats public_interest_stats;
  // final List<String?> status_updates;
  final String last_updated;
  SingleAssetData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.block_time_in_minutes,
    required this.hashing_algorithm,
    required this.categories,
    required this.additional_notices,
    required this.localization,
    required this.description,
    required this.links,
    required this.image,
    required this.country_origin,
    required this.genesis_date,
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.marketCapRank,
    required this.coingeckoRank,
    required this.coingeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.marketData,
    required this.community_data,
    required this.developer_data,
    required this.public_interest_stats,
    // required this.status_updates,
    required this.last_updated,
  });

  SingleAssetData copyWith({
    String? id,
    String? symbol,
    String? name,
    int? block_time_in_minutes,
    String? hashing_algorithm,
    List<String>? categories,
    List<String?>? additional_notices,
    Localization? localization,
    Description? description,
    Links? links,
    Image? image,
    String? country_origin,
    String? genesis_date,
    double? sentimentVotesUpPercentage,
    double? sentimentVotesDownPercentage,
    int? marketCapRank,
    int? coingeckoRank,
    double? coingeckoScore,
    double? developerScore,
    double? communityScore,
    double? liquidityScore,
    double? publicInterestScore,
    MarketData? marketData,
    CommunityData? community_data,
    DeveloperData? developer_data,
    PublicInterestStats? public_interest_stats,
    // List<String>? status_updates,
    String? last_updated,
  }) {
    return SingleAssetData(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      block_time_in_minutes:
          block_time_in_minutes ?? this.block_time_in_minutes,
      hashing_algorithm: hashing_algorithm ?? this.hashing_algorithm,
      categories: categories ?? this.categories,
      additional_notices: additional_notices ?? this.additional_notices,
      localization: localization ?? this.localization,
      description: description ?? this.description,
      links: links ?? this.links,
      image: image ?? this.image,
      country_origin: country_origin ?? this.country_origin,
      genesis_date: genesis_date ?? this.genesis_date,
      sentimentVotesUpPercentage:
          sentimentVotesUpPercentage ?? this.sentimentVotesUpPercentage,
      sentimentVotesDownPercentage:
          sentimentVotesDownPercentage ?? this.sentimentVotesDownPercentage,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      coingeckoRank: coingeckoRank ?? this.coingeckoRank,
      coingeckoScore: coingeckoScore ?? this.coingeckoScore,
      developerScore: developerScore ?? this.developerScore,
      communityScore: communityScore ?? this.communityScore,
      liquidityScore: liquidityScore ?? this.liquidityScore,
      publicInterestScore: publicInterestScore ?? this.publicInterestScore,
      marketData: marketData ?? this.marketData,
      community_data: community_data ?? this.community_data,
      developer_data: developer_data ?? this.developer_data,
      public_interest_stats:
          public_interest_stats ?? this.public_interest_stats,
      // status_updates: status_updates ?? this.status_updates,
      last_updated: last_updated ?? this.last_updated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'block_time_in_minutes': block_time_in_minutes,
      'hashing_algorithm': hashing_algorithm,
      'categories': categories,
      'additional_notices': additional_notices,
      'localization': localization.toMap(),
      'description': description.toMap(),
      'links': links.toMap(),
      'image': image.toMap(),
      'country_origin': country_origin,
      'genesis_date': genesis_date,
      'sentiment_votes_up_percentage': sentimentVotesUpPercentage,
      'sentiment_votes_down_percentage': sentimentVotesDownPercentage,
      'market_cap_rank': marketCapRank,
      'coingecko_rank': coingeckoRank,
      'coingecko_score': coingeckoScore,
      'developer_score': developerScore,
      'community_score': communityScore,
      'liquidity_score': liquidityScore,
      'public_interest_score': publicInterestScore,
      'market_data': marketData.toMap(),
      'community_data': community_data.toMap(),
      'developer_data': developer_data.toMap(),
      'public_interest_stats': public_interest_stats.toMap(),
      // 'status_updates': status_updates,
      'last_updated': last_updated,
    };
  }

  factory SingleAssetData.fromMap(Map<String, dynamic> map) {
    return SingleAssetData(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      block_time_in_minutes: map['block_time_in_minutes']?.toInt(),
      hashing_algorithm: map['hashing_algorithm'],
      categories: List<String>.from(map['categories']),
      additional_notices: List<String?>.from(map['additional_notices']),
      localization: Localization.fromMap(map['localization']),
      description: Description.fromMap(map['description']),
      links: Links.fromMap(map['links']),
      image: Image.fromMap(map['image']),
      country_origin: map['country_origin'],
      genesis_date: map['genesis_date'],
      sentimentVotesUpPercentage:
          map['sentiment_votes_up_percentage']?.toDouble(),
      sentimentVotesDownPercentage:
          map['sentiment_votes_down_percentage']?.toDouble(),
      marketCapRank: map['market_cap_rank']?.toInt(),
      coingeckoRank: map['coingecko_rank']?.toInt(),
      coingeckoScore: map['coingecko_score']?.toDouble(),
      developerScore: map['developer_score']?.toDouble(),
      communityScore: map['community_score']?.toDouble(),
      liquidityScore: map['liquidity_score']?.toDouble(),
      publicInterestScore: map['public_interest_score']?.toDouble(),
      marketData: MarketData.fromMap(map['market_data']),
      community_data: CommunityData.fromMap(map['community_data']),
      developer_data: DeveloperData.fromMap(map['developer_data']),
      public_interest_stats:
          PublicInterestStats.fromMap(map['public_interest_stats']),
      // status_updates: List<String?>.from(map['status_updates']),
      last_updated: map['last_updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleAssetData.fromJson(String source) =>
      SingleAssetData.fromMap(jsonDecode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      symbol,
      name,
      block_time_in_minutes,
      hashing_algorithm,
      categories,
      additional_notices,
      localization,
      description,
      links,
      image,
      country_origin,
      genesis_date,
      sentimentVotesUpPercentage,
      sentimentVotesDownPercentage,
      marketCapRank,
      coingeckoRank,
      coingeckoScore,
      developerScore,
      communityScore,
      liquidityScore,
      publicInterestScore,
      marketData,
      community_data,
      developer_data,
      public_interest_stats,
      // status_updates,
      last_updated,
    ];
  }
}

class Localization extends Equatable {
  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;
  Localization({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
  });

  Localization copyWith({
    String? en,
    String? de,
    String? es,
    String? fr,
    String? it,
    String? pl,
    String? ro,
    String? hu,
    String? nl,
    String? pt,
    String? sv,
    String? vi,
    String? tr,
    String? ru,
    String? ja,
    String? zh,
    String? zhTw,
    String? ko,
    String? ar,
    String? th,
    String? id,
  }) {
    return Localization(
      en: en ?? this.en,
      de: de ?? this.de,
      es: es ?? this.es,
      fr: fr ?? this.fr,
      it: it ?? this.it,
      pl: pl ?? this.pl,
      ro: ro ?? this.ro,
      hu: hu ?? this.hu,
      nl: nl ?? this.nl,
      pt: pt ?? this.pt,
      sv: sv ?? this.sv,
      vi: vi ?? this.vi,
      tr: tr ?? this.tr,
      ru: ru ?? this.ru,
      ja: ja ?? this.ja,
      zh: zh ?? this.zh,
      zhTw: zhTw ?? this.zhTw,
      ko: ko ?? this.ko,
      ar: ar ?? this.ar,
      th: th ?? this.th,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'de': de,
      'es': es,
      'fr': fr,
      'it': it,
      'pl': pl,
      'ro': ro,
      'hu': hu,
      'nl': nl,
      'pt': pt,
      'sv': sv,
      'vi': vi,
      'tr': tr,
      'ru': ru,
      'ja': ja,
      'zh': zh,
      'zh-tw': zhTw,
      'ko': ko,
      'ar': ar,
      'th': th,
      'id': id,
    };
  }

  factory Localization.fromMap(Map<String, dynamic> map) {
    return Localization(
      en: map['en'],
      de: map['de'],
      es: map['es'],
      fr: map['fr'],
      it: map['it'],
      pl: map['pl'],
      ro: map['ro'],
      hu: map['hu'],
      nl: map['nl'],
      pt: map['pt'],
      sv: map['sv'],
      vi: map['vi'],
      tr: map['tr'],
      ru: map['ru'],
      ja: map['ja'],
      zh: map['zh'],
      zhTw: map['zh-tw'],
      ko: map['ko'],
      ar: map['ar'],
      th: map['th'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Localization.fromJson(String source) =>
      Localization.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      en,
      de,
      es,
      fr,
      it,
      pl,
      ro,
      hu,
      nl,
      pt,
      sv,
      vi,
      tr,
      ru,
      ja,
      zh,
      zhTw,
      ko,
      ar,
      th,
      id,
    ];
  }
}

class Description extends Equatable {
  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;
  Description({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
  });

  Description copyWith({
    String? en,
    String? de,
    String? es,
    String? fr,
    String? it,
    String? pl,
    String? ro,
    String? hu,
    String? nl,
    String? pt,
    String? sv,
    String? vi,
    String? tr,
    String? ru,
    String? ja,
    String? zh,
    String? zhTw,
    String? ko,
    String? ar,
    String? th,
    String? id,
  }) {
    return Description(
      en: en ?? this.en,
      de: de ?? this.de,
      es: es ?? this.es,
      fr: fr ?? this.fr,
      it: it ?? this.it,
      pl: pl ?? this.pl,
      ro: ro ?? this.ro,
      hu: hu ?? this.hu,
      nl: nl ?? this.nl,
      pt: pt ?? this.pt,
      sv: sv ?? this.sv,
      vi: vi ?? this.vi,
      tr: tr ?? this.tr,
      ru: ru ?? this.ru,
      ja: ja ?? this.ja,
      zh: zh ?? this.zh,
      zhTw: zhTw ?? this.zhTw,
      ko: ko ?? this.ko,
      ar: ar ?? this.ar,
      th: th ?? this.th,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'de': de,
      'es': es,
      'fr': fr,
      'it': it,
      'pl': pl,
      'ro': ro,
      'hu': hu,
      'nl': nl,
      'pt': pt,
      'sv': sv,
      'vi': vi,
      'tr': tr,
      'ru': ru,
      'ja': ja,
      'zh': zh,
      'zh-tw': zhTw,
      'ko': ko,
      'ar': ar,
      'th': th,
      'id': id,
    };
  }

  factory Description.fromMap(Map<String, dynamic> map) {
    return Description(
      en: map['en'],
      de: map['de'],
      es: map['es'],
      fr: map['fr'],
      it: map['it'],
      pl: map['pl'],
      ro: map['ro'],
      hu: map['hu'],
      nl: map['nl'],
      pt: map['pt'],
      sv: map['sv'],
      vi: map['vi'],
      tr: map['tr'],
      ru: map['ru'],
      ja: map['ja'],
      zh: map['zh'],
      zhTw: map['zh-tw'],
      ko: map['ko'],
      ar: map['ar'],
      th: map['th'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Description.fromJson(String source) =>
      Description.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      en,
      de,
      es,
      fr,
      it,
      pl,
      ro,
      hu,
      nl,
      pt,
      sv,
      vi,
      tr,
      ru,
      ja,
      zh,
      zhTw,
      ko,
      ar,
      th,
      id,
    ];
  }
}

class Links extends Equatable {
  final List<String> homepage;
  final List<String> blockchain_site;
  final List<String> official_forum_url;
  final List<String> chat_url;
  final List<String> announcement_url;
  final String? twitter_screen_name;
  final String? facebook_username;
  final String? telegram_channel_identifier;
  final String? subreddit_url;
  final ReposUrl repos_url;
  Links({
    required this.homepage,
    required this.blockchain_site,
    required this.official_forum_url,
    required this.chat_url,
    required this.announcement_url,
    required this.twitter_screen_name,
    required this.facebook_username,
    required this.telegram_channel_identifier,
    required this.subreddit_url,
    required this.repos_url,
  });

  Links copyWith({
    List<String>? homepage,
    List<String>? blockchain_site,
    List<String>? official_forum_url,
    List<String>? chat_url,
    List<String>? announcement_url,
    String? twitter_screen_name,
    String? facebook_username,
    String? telegram_channel_identifier,
    String? subreddit_url,
    ReposUrl? repos_url,
  }) {
    return Links(
      homepage: homepage ?? this.homepage,
      blockchain_site: blockchain_site ?? this.blockchain_site,
      official_forum_url: official_forum_url ?? this.official_forum_url,
      chat_url: chat_url ?? this.chat_url,
      announcement_url: announcement_url ?? this.announcement_url,
      twitter_screen_name: twitter_screen_name ?? this.twitter_screen_name,
      facebook_username: facebook_username ?? this.facebook_username,
      telegram_channel_identifier:
          telegram_channel_identifier ?? this.telegram_channel_identifier,
      subreddit_url: subreddit_url ?? this.subreddit_url,
      repos_url: repos_url ?? this.repos_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homepage': homepage,
      'blockchain_site': blockchain_site,
      'official_forum_url': official_forum_url,
      'chat_url': chat_url,
      'announcement_url': announcement_url,
      'twitter_screen_name': twitter_screen_name,
      'facebook_username': facebook_username,
      'telegram_channel_identifier': telegram_channel_identifier,
      'subreddit_url': subreddit_url,
      'repos_url': repos_url.toMap(),
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      homepage: List<String>.from(map['homepage']),
      blockchain_site: List<String>.from(map['blockchain_site']),
      official_forum_url: List<String>.from(map['official_forum_url']),
      chat_url: List<String>.from(map['chat_url']),
      announcement_url: List<String>.from(map['announcement_url']),
      twitter_screen_name: map['twitter_screen_name'],
      facebook_username: map['facebook_username'],
      telegram_channel_identifier: map['telegram_channel_identifier'],
      subreddit_url: map['subreddit_url'],
      repos_url: ReposUrl.fromMap(map['repos_url']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      homepage,
      blockchain_site,
      official_forum_url,
      chat_url,
      announcement_url,
      twitter_screen_name,
      facebook_username,
      telegram_channel_identifier,
      subreddit_url,
      repos_url,
    ];
  }
}

class ReposUrl extends Equatable {
  final List<String> github;
  final List<String> bitbucket;
  ReposUrl({
    required this.github,
    required this.bitbucket,
  });

  ReposUrl copyWith({
    List<String>? github,
    List<String>? bitbucket,
  }) {
    return ReposUrl(
      github: github ?? this.github,
      bitbucket: bitbucket ?? this.bitbucket,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'github': github,
      'bitbucket': bitbucket,
    };
  }

  factory ReposUrl.fromMap(Map<String, dynamic> map) {
    return ReposUrl(
      github: List<String>.from(map['github']),
      bitbucket: List<String>.from(map['bitbucket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposUrl.fromJson(String source) =>
      ReposUrl.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [github, bitbucket];
}

class Image extends Equatable {
  final String thumb;
  final String small;
  final String large;
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  Image copyWith({
    String? thumb,
    String? small,
    String? large,
  }) {
    return Image(
      thumb: thumb ?? this.thumb,
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumb': thumb,
      'small': small,
      'large': large,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      thumb: map['thumb'],
      small: map['small'],
      large: map['large'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [thumb, small, large];
}

class MarketData extends Equatable {
  final ValuePerCurrency current_price;
  final ValuePerCurrency? total_value_locked;
  final double? mcap_to_tvl_ratio;
  final double? fdv_to_tvl_ratio;
  final Roi roi;
  final Ath ath;
  final AthChangePercentage ath_change_percentage;
  final AthDate ath_date;
  final Atl atl;
  final AtlChangePercentage atl_change_percentage;
  final AtlDate atl_date;
  final MarketCap market_cap;
  final int market_cap_rank;
  final FullyDilutedValuation fully_diluted_valuation;
  final TotalVolume total_volume;
  final High24h high_24h;
  final Low24h low_24h;
  final double price_change_24h;
  final double price_change_percentage_24h;
  final double price_change_percentage_7d;
  final double price_change_percentage_14d;
  final double price_change_percentage_30d;
  final double price_change_percentage_60d;
  final double price_change_percentage_200d;
  final double price_change_percentage_1y;
  final double market_cap_change_24h;
  final double market_cap_change_percentage_24h;
  final ValuePerCurrency? price_change_24h_in_currency;
  final ValuePerCurrency? price_change_percentage_1h_in_currency;
  final ValuePerCurrency? price_change_percentage_24h_in_currency;
  final ValuePerCurrency? price_change_percentage_7d_in_currency;
  final ValuePerCurrency? price_change_percentage_14d_in_currency;
  final ValuePerCurrency? price_change_percentage_30d_in_currency;
  final ValuePerCurrency? price_change_percentage_60d_in_currency;
  final ValuePerCurrency? price_change_percentage_200d_in_currency;
  final ValuePerCurrency? priceChangePercentage1yInCurrency;
  final MarketCapChange24hInCurrency market_cap_change_24h_in_currency;
  final MarketCapChangePercentage24hInCurrency
      market_cap_change_percentage_24h_in_currency;
  final int? total_supply;
  final int? max_supply;
  final int? circulating_supply;
  final String last_updated;
  MarketData({
    required this.current_price,
    required this.total_value_locked,
    required this.mcap_to_tvl_ratio,
    required this.fdv_to_tvl_ratio,
    required this.roi,
    required this.ath,
    required this.ath_change_percentage,
    required this.ath_date,
    required this.atl,
    required this.atl_change_percentage,
    required this.atl_date,
    required this.market_cap,
    required this.market_cap_rank,
    required this.fully_diluted_valuation,
    required this.total_volume,
    required this.high_24h,
    required this.low_24h,
    required this.price_change_24h,
    required this.price_change_percentage_24h,
    required this.price_change_percentage_7d,
    required this.price_change_percentage_14d,
    required this.price_change_percentage_30d,
    required this.price_change_percentage_60d,
    required this.price_change_percentage_200d,
    required this.price_change_percentage_1y,
    required this.market_cap_change_24h,
    required this.market_cap_change_percentage_24h,
    required this.price_change_24h_in_currency,
    required this.price_change_percentage_1h_in_currency,
    required this.price_change_percentage_24h_in_currency,
    required this.price_change_percentage_7d_in_currency,
    required this.price_change_percentage_14d_in_currency,
    required this.price_change_percentage_30d_in_currency,
    required this.price_change_percentage_60d_in_currency,
    required this.price_change_percentage_200d_in_currency,
    required this.priceChangePercentage1yInCurrency,
    required this.market_cap_change_24h_in_currency,
    required this.market_cap_change_percentage_24h_in_currency,
    required this.total_supply,
    required this.max_supply,
    required this.circulating_supply,
    required this.last_updated,
  });

  MarketData copyWith({
    ValuePerCurrency? current_price,
    ValuePerCurrency? total_value_locked,
    double? mcap_to_tvl_ratio,
    double? fdv_to_tvl_ratio,
    Roi? roi,
    Ath? ath,
    AthChangePercentage? ath_change_percentage,
    AthDate? ath_date,
    Atl? atl,
    AtlChangePercentage? atl_change_percentage,
    AtlDate? atl_date,
    MarketCap? market_cap,
    int? market_cap_rank,
    FullyDilutedValuation? fully_diluted_valuation,
    TotalVolume? total_volume,
    High24h? high_24h,
    Low24h? low_24h,
    double? price_change_24h,
    double? price_change_percentage_24h,
    double? price_change_percentage_7d,
    double? price_change_percentage_14d,
    double? price_change_percentage_30d,
    double? price_change_percentage_60d,
    double? price_change_percentage_200d,
    double? price_change_percentage_1y,
    double? market_cap_change_24h,
    double? market_cap_change_percentage_24h,
    ValuePerCurrency? price_change_24h_in_currency,
    ValuePerCurrency? price_change_percentage_1h_in_currency,
    ValuePerCurrency? price_change_percentage_24h_in_currency,
    ValuePerCurrency? price_change_percentage_7d_in_currency,
    ValuePerCurrency? price_change_percentage_14d_in_currency,
    ValuePerCurrency? price_change_percentage_30d_in_currency,
    ValuePerCurrency? price_change_percentage_60d_in_currency,
    ValuePerCurrency? price_change_percentage_200d_in_currency,
    ValuePerCurrency? priceChangePercentage1yInCurrency,
    MarketCapChange24hInCurrency? market_cap_change_24h_in_currency,
    MarketCapChangePercentage24hInCurrency?
        market_cap_change_percentage_24h_in_currency,
    int? total_supply,
    int? max_supply,
    int? circulating_supply,
    String? last_updated,
  }) {
    return MarketData(
      current_price: current_price ?? this.current_price,
      total_value_locked: total_value_locked ?? this.total_value_locked,
      mcap_to_tvl_ratio: mcap_to_tvl_ratio ?? this.mcap_to_tvl_ratio,
      fdv_to_tvl_ratio: fdv_to_tvl_ratio ?? this.fdv_to_tvl_ratio,
      roi: roi ?? this.roi,
      ath: ath ?? this.ath,
      ath_change_percentage:
          ath_change_percentage ?? this.ath_change_percentage,
      ath_date: ath_date ?? this.ath_date,
      atl: atl ?? this.atl,
      atl_change_percentage:
          atl_change_percentage ?? this.atl_change_percentage,
      atl_date: atl_date ?? this.atl_date,
      market_cap: market_cap ?? this.market_cap,
      market_cap_rank: market_cap_rank ?? this.market_cap_rank,
      fully_diluted_valuation:
          fully_diluted_valuation ?? this.fully_diluted_valuation,
      total_volume: total_volume ?? this.total_volume,
      high_24h: high_24h ?? this.high_24h,
      low_24h: low_24h ?? this.low_24h,
      price_change_24h: price_change_24h ?? this.price_change_24h,
      price_change_percentage_24h:
          price_change_percentage_24h ?? this.price_change_percentage_24h,
      price_change_percentage_7d:
          price_change_percentage_7d ?? this.price_change_percentage_7d,
      price_change_percentage_14d:
          price_change_percentage_14d ?? this.price_change_percentage_14d,
      price_change_percentage_30d:
          price_change_percentage_30d ?? this.price_change_percentage_30d,
      price_change_percentage_60d:
          price_change_percentage_60d ?? this.price_change_percentage_60d,
      price_change_percentage_200d:
          price_change_percentage_200d ?? this.price_change_percentage_200d,
      price_change_percentage_1y:
          price_change_percentage_1y ?? this.price_change_percentage_1y,
      market_cap_change_24h:
          market_cap_change_24h ?? this.market_cap_change_24h,
      market_cap_change_percentage_24h: market_cap_change_percentage_24h ??
          this.market_cap_change_percentage_24h,
      price_change_24h_in_currency:
          price_change_24h_in_currency ?? this.price_change_24h_in_currency,
      price_change_percentage_1h_in_currency:
          price_change_percentage_1h_in_currency ??
              this.price_change_percentage_1h_in_currency,
      price_change_percentage_24h_in_currency:
          price_change_percentage_24h_in_currency ??
              this.price_change_percentage_24h_in_currency,
      price_change_percentage_7d_in_currency:
          price_change_percentage_7d_in_currency ??
              this.price_change_percentage_7d_in_currency,
      price_change_percentage_14d_in_currency:
          price_change_percentage_14d_in_currency ??
              this.price_change_percentage_14d_in_currency,
      price_change_percentage_30d_in_currency:
          price_change_percentage_30d_in_currency ??
              this.price_change_percentage_30d_in_currency,
      price_change_percentage_60d_in_currency:
          price_change_percentage_60d_in_currency ??
              this.price_change_percentage_60d_in_currency,
      price_change_percentage_200d_in_currency:
          price_change_percentage_200d_in_currency ??
              this.price_change_percentage_200d_in_currency,
      priceChangePercentage1yInCurrency: priceChangePercentage1yInCurrency ??
          this.priceChangePercentage1yInCurrency,
      market_cap_change_24h_in_currency: market_cap_change_24h_in_currency ??
          this.market_cap_change_24h_in_currency,
      market_cap_change_percentage_24h_in_currency:
          market_cap_change_percentage_24h_in_currency ??
              this.market_cap_change_percentage_24h_in_currency,
      total_supply: total_supply ?? this.total_supply,
      max_supply: max_supply ?? this.max_supply,
      circulating_supply: circulating_supply ?? this.circulating_supply,
      last_updated: last_updated ?? this.last_updated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_price': current_price.toMap(),
      'total_value_locked': total_value_locked,
      'mcap_to_tvl_ratio': mcap_to_tvl_ratio,
      'fdv_to_tvl_ratio': fdv_to_tvl_ratio,
      'roi': roi.toMap(),
      'ath': ath.toMap(),
      'ath_change_percentage': ath_change_percentage.toMap(),
      'ath_date': ath_date.toMap(),
      'atl': atl.toMap(),
      'atl_change_percentage': atl_change_percentage.toMap(),
      'atl_date': atl_date.toMap(),
      'market_cap': market_cap.toMap(),
      'market_cap_rank': market_cap_rank,
      'fully_diluted_valuation': fully_diluted_valuation.toMap(),
      'total_volume': total_volume.toMap(),
      'high_24h': high_24h.toMap(),
      'low_24h': low_24h.toMap(),
      'price_change_24h': price_change_24h,
      'price_change_percentage_24h': price_change_percentage_24h,
      'price_change_percentage_7d': price_change_percentage_7d,
      'price_change_percentage_14d': price_change_percentage_14d,
      'price_change_percentage_30d': price_change_percentage_30d,
      'price_change_percentage_60d': price_change_percentage_60d,
      'price_change_percentage_200d': price_change_percentage_200d,
      'price_change_percentage_1y': price_change_percentage_1y,
      'market_cap_change_24h': market_cap_change_24h,
      'market_cap_change_percentage_24h': market_cap_change_percentage_24h,
      'price_change_24h_in_currency': price_change_24h_in_currency?.toMap(),
      'price_change_percentage_1h_in_currency':
          price_change_percentage_1h_in_currency?.toMap(),
      'price_change_percentage_24h_in_currency':
          price_change_percentage_24h_in_currency?.toMap(),
      'price_change_percentage_7d_in_currency':
          price_change_percentage_7d_in_currency?.toMap(),
      'price_change_percentage_14d_in_currency':
          price_change_percentage_14d_in_currency?.toMap(),
      'price_change_percentage_30d_in_currency':
          price_change_percentage_30d_in_currency?.toMap(),
      'price_change_percentage_60d_in_currency':
          price_change_percentage_60d_in_currency?.toMap(),
      'price_change_percentage_200d_in_currency':
          price_change_percentage_200d_in_currency?.toMap(),
      'price_change_percentage_1y_in_currency':
          priceChangePercentage1yInCurrency?.toMap(),
      'market_cap_change_24h_in_currency':
          market_cap_change_24h_in_currency.toMap(),
      'market_cap_change_percentage_24h_in_currency':
          market_cap_change_percentage_24h_in_currency.toMap(),
      'total_supply': total_supply,
      'max_supply': max_supply,
      'circulating_supply': circulating_supply,
      'last_updated': last_updated,
    };
  }

  factory MarketData.fromMap(Map<String, dynamic> map) {
    return MarketData(
      current_price: ValuePerCurrency.fromMap(map['current_price']),
      total_value_locked: map['total_value_locked'] != null
          ? ValuePerCurrency.fromMap(map['total_value_locked'])
          : null,
      mcap_to_tvl_ratio: map['mcap_to_tvl_ratio'],
      fdv_to_tvl_ratio:
          map['fdv_to_tvl_ratio'] != null && map['fdv_to_tvl_ratio'] == '?'
              ? null
              : map['fdv_to_tvl_ratio'],
      roi: Roi.fromMap(map['roi']),
      ath: Ath.fromMap(map['ath']),
      ath_change_percentage:
          AthChangePercentage.fromMap(map['ath_change_percentage']),
      ath_date: AthDate.fromMap(map['ath_date']),
      atl: Atl.fromMap(map['atl']),
      atl_change_percentage:
          AtlChangePercentage.fromMap(map['atl_change_percentage']),
      atl_date: AtlDate.fromMap(map['atl_date']),
      market_cap: MarketCap.fromMap(map['market_cap']),
      market_cap_rank: map['market_cap_rank']?.toInt(),
      fully_diluted_valuation:
          FullyDilutedValuation.fromMap(map['fully_diluted_valuation']),
      total_volume: TotalVolume.fromMap(map['total_volume']),
      high_24h: High24h.fromMap(map['high_24h']),
      low_24h: Low24h.fromMap(map['low_24h']),
      price_change_24h: map['price_change_24h']?.toDouble(),
      price_change_percentage_24h:
          map['price_change_percentage_24h']?.toDouble(),
      price_change_percentage_7d: map['price_change_percentage_7d']?.toDouble(),
      price_change_percentage_14d:
          map['price_change_percentage_14d']?.toDouble(),
      price_change_percentage_30d:
          map['price_change_percentage_30d']?.toDouble(),
      price_change_percentage_60d:
          map['price_change_percentage_60d']?.toDouble(),
      price_change_percentage_200d:
          map['price_change_percentage_200d']?.toDouble(),
      price_change_percentage_1y: map['price_change_percentage_1y']?.toDouble(),
      market_cap_change_24h: map['market_cap_change_24h']?.toDouble(),
      market_cap_change_percentage_24h:
          map['market_cap_change_percentage_24h']?.toDouble(),
      price_change_24h_in_currency: map['price_change_24h_in_currency'] != null
          ? ValuePerCurrency.fromMap(map['price_change_24h_in_currency'])
          : null,
      price_change_percentage_1h_in_currency:
          map['price_change_percentage_1h_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_1h_in_currency'])
              : null,
      price_change_percentage_24h_in_currency:
          map['price_change_percentage_24h_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_24h_in_currency'])
              : null,
      price_change_percentage_7d_in_currency:
          map['price_change_percentage_7d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_7d_in_currency'])
              : null,
      price_change_percentage_14d_in_currency:
          map['price_change_percentage_14d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_14d_in_currency'])
              : null,
      price_change_percentage_30d_in_currency:
          map['price_change_percentage_30d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_30d_in_currency'])
              : null,
      price_change_percentage_60d_in_currency:
          map['price_change_percentage_60d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_60d_in_currency'])
              : null,
      price_change_percentage_200d_in_currency: ValuePerCurrency.fromMap(
          map['price_change_percentage_200d_in_currency']),
      priceChangePercentage1yInCurrency:
          map['price_change_percentage_1y_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_1y_in_currency'])
              : null,
      market_cap_change_24h_in_currency: MarketCapChange24hInCurrency.fromMap(
          map['market_cap_change_24h_in_currency']),
      market_cap_change_percentage_24h_in_currency:
          MarketCapChangePercentage24hInCurrency.fromMap(
              map['market_cap_change_percentage_24h_in_currency']),
      total_supply: map['total_supply']?.toInt(),
      max_supply: map['max_supply']?.toInt(),
      circulating_supply: map['circulating_supply']?.toInt(),
      last_updated: map['last_updated'],
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
      current_price,
      total_value_locked,
      mcap_to_tvl_ratio,
      fdv_to_tvl_ratio,
      roi,
      ath,
      ath_change_percentage,
      ath_date,
      atl,
      atl_change_percentage,
      atl_date,
      market_cap,
      market_cap_rank,
      fully_diluted_valuation,
      total_volume,
      high_24h,
      low_24h,
      price_change_24h,
      price_change_percentage_24h,
      price_change_percentage_7d,
      price_change_percentage_14d,
      price_change_percentage_30d,
      price_change_percentage_60d,
      price_change_percentage_200d,
      price_change_percentage_1y,
      market_cap_change_24h,
      market_cap_change_percentage_24h,
      price_change_24h_in_currency,
      price_change_percentage_1h_in_currency,
      price_change_percentage_24h_in_currency,
      price_change_percentage_7d_in_currency,
      price_change_percentage_14d_in_currency,
      price_change_percentage_30d_in_currency,
      price_change_percentage_60d_in_currency,
      price_change_percentage_200d_in_currency,
      priceChangePercentage1yInCurrency,
      market_cap_change_24h_in_currency,
      market_cap_change_percentage_24h_in_currency,
      total_supply,
      max_supply,
      circulating_supply,
      last_updated,
    ];
  }
}

class ValuePerCurrency extends Equatable {
  final double? aed;
  final double? ars;
  final double? aud;
  final double? bch;
  final double? bdt;
  final double? bhd;
  final double? bmd;
  final double? bnb;
  final double? brl;
  final double? btc;
  final double? cad;
  final double? chf;
  final double? clp;
  final double? cny;
  final double? czk;
  final double? dkk;
  final double? dot;
  final double? eos;
  final double? eth;
  final double? eur;
  final double? gbp;
  final double? hkd;
  final double? huf;
  final double? idr;
  final double? ils;
  final double? inr;
  final double? jpy;
  final double? krw;
  final double? kwd;
  final double? lkr;
  final double? ltc;
  final double? mmk;
  final double? mxn;
  final double? myr;
  final double? ngn;
  final double? nok;
  final double? nzd;
  final double? php;
  final double? pkr;
  final double? pln;
  final double? rub;
  final double? sar;
  final double? sek;
  final double? sgd;
  final double? thb;
  final double? tTry;
  final double? twd;
  final double? uah;
  final double? usd;
  final double? vef;
  final double? vnd;
  final double? xag;
  final double? xau;
  final double? xdr;
  final double? xlm;
  final double? xrp;
  final double? yfi;
  final double? zar;
  final double? bits;
  final double? link;
  final double? sats;
  ValuePerCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  ValuePerCurrency copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    double? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    double? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return ValuePerCurrency(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory ValuePerCurrency.fromMap(Map<String, dynamic> map) {
    return ValuePerCurrency(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toDouble(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ValuePerCurrency.fromJson(String source) =>
      ValuePerCurrency.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class Roi extends Equatable {
  final double? times;
  final String? currency;
  final double? percentage;

  Roi({this.times, this.currency, this.percentage});

  factory Roi.fromMap(Map<String, dynamic>? json) {
    return Roi(
        times: json?['times']?.toDouble(),
        currency: json?['currency']?.toString(),
        percentage: json?['percentage']?.toDouble());
  }

  Map<String, dynamic> toMap() {
    return {'times': times, 'currency': currency, 'percentage': percentage};
  }

  String toJson() => json.encode(toMap());

  factory Roi.fromJson(String source) => Roi.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [times, currency, percentage];
}

class Ath extends Equatable {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final double btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  Ath({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  Ath copyWith({
    int? aed,
    int? ars,
    int? aud,
    double? bch,
    int? bdt,
    int? bhd,
    int? bmd,
    int? bnb,
    int? brl,
    double? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    double? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    double? kwd,
    int? lkr,
    double? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    int? vef,
    int? vnd,
    double? xag,
    double? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    double? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return Ath(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory Ath.fromMap(Map<String, dynamic> map) {
    return Ath(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toInt(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toInt(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toInt(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ath.fromJson(String source) => Ath.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class AthChangePercentage extends Equatable {
  final double? aed;
  final double? ars;
  final double? aud;
  final double? bch;
  final double? bdt;
  final double? bhd;
  final double? bmd;
  final double? bnb;
  final double? brl;
  final double? btc;
  final double? cad;
  final double? chf;
  final double? clp;
  final double? cny;
  final double? czk;
  final double? dkk;
  final double? dot;
  final double? eos;
  final double? eth;
  final double? eur;
  final double? gbp;
  final double? hkd;
  final double? huf;
  final double? idr;
  final double? ils;
  final double? inr;
  final double? jpy;
  final double? krw;
  final double? kwd;
  final double? lkr;
  final double? ltc;
  final double? mmk;
  final double? mxn;
  final double? myr;
  final double? ngn;
  final double? nok;
  final double? nzd;
  final double? php;
  final double? pkr;
  final double? pln;
  final double? rub;
  final double? sar;
  final double? sek;
  final double? sgd;
  final double? thb;
  final double? tTry;
  final double? twd;
  final double? uah;
  final double? usd;
  final double? vef;
  final double? vnd;
  final double? xag;
  final double? xau;
  final double? xdr;
  final double? xlm;
  final double? xrp;
  final double? yfi;
  final double? zar;
  final double? bits;
  final double? link;
  final double? sats;
  AthChangePercentage({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  AthChangePercentage copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    double? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    double? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return AthChangePercentage(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory AthChangePercentage.fromMap(Map<String, dynamic> map) {
    return AthChangePercentage(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toDouble(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AthChangePercentage.fromJson(String source) =>
      AthChangePercentage.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class AthDate extends Equatable {
  final String aed;
  final String ars;
  final String aud;
  final String bch;
  final String bdt;
  final String bhd;
  final String bmd;
  final String bnb;
  final String brl;
  final String btc;
  final String cad;
  final String chf;
  final String clp;
  final String cny;
  final String czk;
  final String dkk;
  final String dot;
  final String eos;
  final String eth;
  final String eur;
  final String gbp;
  final String hkd;
  final String huf;
  final String idr;
  final String ils;
  final String inr;
  final String jpy;
  final String krw;
  final String kwd;
  final String lkr;
  final String ltc;
  final String mmk;
  final String mxn;
  final String myr;
  final String ngn;
  final String nok;
  final String nzd;
  final String php;
  final String pkr;
  final String pln;
  final String rub;
  final String sar;
  final String sek;
  final String sgd;
  final String thb;
  final String tTry;
  final String twd;
  final String uah;
  final String usd;
  final String vef;
  final String vnd;
  final String xag;
  final String xau;
  final String xdr;
  final String xlm;
  final String xrp;
  final String yfi;
  final String zar;
  final String bits;
  final String link;
  final String sats;
  AthDate({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  AthDate copyWith({
    String? aed,
    String? ars,
    String? aud,
    String? bch,
    String? bdt,
    String? bhd,
    String? bmd,
    String? bnb,
    String? brl,
    String? btc,
    String? cad,
    String? chf,
    String? clp,
    String? cny,
    String? czk,
    String? dkk,
    String? dot,
    String? eos,
    String? eth,
    String? eur,
    String? gbp,
    String? hkd,
    String? huf,
    String? idr,
    String? ils,
    String? inr,
    String? jpy,
    String? krw,
    String? kwd,
    String? lkr,
    String? ltc,
    String? mmk,
    String? mxn,
    String? myr,
    String? ngn,
    String? nok,
    String? nzd,
    String? php,
    String? pkr,
    String? pln,
    String? rub,
    String? sar,
    String? sek,
    String? sgd,
    String? thb,
    String? tTry,
    String? twd,
    String? uah,
    String? usd,
    String? vef,
    String? vnd,
    String? xag,
    String? xau,
    String? xdr,
    String? xlm,
    String? xrp,
    String? yfi,
    String? zar,
    String? bits,
    String? link,
    String? sats,
  }) {
    return AthDate(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory AthDate.fromMap(Map<String, dynamic> map) {
    return AthDate(
      aed: map['aed'],
      ars: map['ars'],
      aud: map['aud'],
      bch: map['bch'],
      bdt: map['bdt'],
      bhd: map['bhd'],
      bmd: map['bmd'],
      bnb: map['bnb'],
      brl: map['brl'],
      btc: map['btc'],
      cad: map['cad'],
      chf: map['chf'],
      clp: map['clp'],
      cny: map['cny'],
      czk: map['czk'],
      dkk: map['dkk'],
      dot: map['dot'],
      eos: map['eos'],
      eth: map['eth'],
      eur: map['eur'],
      gbp: map['gbp'],
      hkd: map['hkd'],
      huf: map['huf'],
      idr: map['idr'],
      ils: map['ils'],
      inr: map['inr'],
      jpy: map['jpy'],
      krw: map['krw'],
      kwd: map['kwd'],
      lkr: map['lkr'],
      ltc: map['ltc'],
      mmk: map['mmk'],
      mxn: map['mxn'],
      myr: map['myr'],
      ngn: map['ngn'],
      nok: map['nok'],
      nzd: map['nzd'],
      php: map['php'],
      pkr: map['pkr'],
      pln: map['pln'],
      rub: map['rub'],
      sar: map['sar'],
      sek: map['sek'],
      sgd: map['sgd'],
      thb: map['thb'],
      tTry: map['try'],
      twd: map['twd'],
      uah: map['uah'],
      usd: map['usd'],
      vef: map['vef'],
      vnd: map['vnd'],
      xag: map['xag'],
      xau: map['xau'],
      xdr: map['xdr'],
      xlm: map['xlm'],
      xrp: map['xrp'],
      yfi: map['yfi'],
      zar: map['zar'],
      bits: map['bits'],
      link: map['link'],
      sats: map['sats'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AthDate.fromJson(String source) =>
      AthDate.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class Atl extends Equatable {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  Atl({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  Atl copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    double? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    double? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return Atl(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory Atl.fromMap(Map<String, dynamic> map) {
    return Atl(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toDouble(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Atl.fromJson(String source) => Atl.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class AtlChangePercentage extends Equatable {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  AtlChangePercentage({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  AtlChangePercentage copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    double? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    double? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return AtlChangePercentage(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory AtlChangePercentage.fromMap(Map<String, dynamic> map) {
    return AtlChangePercentage(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toDouble(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AtlChangePercentage.fromJson(String source) =>
      AtlChangePercentage.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class AtlDate extends Equatable {
  final String aed;
  final String ars;
  final String aud;
  final String bch;
  final String bdt;
  final String bhd;
  final String bmd;
  final String bnb;
  final String brl;
  final String btc;
  final String cad;
  final String chf;
  final String clp;
  final String cny;
  final String czk;
  final String dkk;
  final String dot;
  final String eos;
  final String eth;
  final String eur;
  final String gbp;
  final String hkd;
  final String huf;
  final String idr;
  final String ils;
  final String inr;
  final String jpy;
  final String krw;
  final String kwd;
  final String lkr;
  final String ltc;
  final String mmk;
  final String mxn;
  final String myr;
  final String ngn;
  final String nok;
  final String nzd;
  final String php;
  final String pkr;
  final String pln;
  final String rub;
  final String sar;
  final String sek;
  final String sgd;
  final String thb;
  final String tTry;
  final String twd;
  final String uah;
  final String usd;
  final String vef;
  final String vnd;
  final String xag;
  final String xau;
  final String xdr;
  final String xlm;
  final String xrp;
  final String yfi;
  final String zar;
  final String bits;
  final String link;
  final String sats;
  AtlDate({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  AtlDate copyWith({
    String? aed,
    String? ars,
    String? aud,
    String? bch,
    String? bdt,
    String? bhd,
    String? bmd,
    String? bnb,
    String? brl,
    String? btc,
    String? cad,
    String? chf,
    String? clp,
    String? cny,
    String? czk,
    String? dkk,
    String? dot,
    String? eos,
    String? eth,
    String? eur,
    String? gbp,
    String? hkd,
    String? huf,
    String? idr,
    String? ils,
    String? inr,
    String? jpy,
    String? krw,
    String? kwd,
    String? lkr,
    String? ltc,
    String? mmk,
    String? mxn,
    String? myr,
    String? ngn,
    String? nok,
    String? nzd,
    String? php,
    String? pkr,
    String? pln,
    String? rub,
    String? sar,
    String? sek,
    String? sgd,
    String? thb,
    String? tTry,
    String? twd,
    String? uah,
    String? usd,
    String? vef,
    String? vnd,
    String? xag,
    String? xau,
    String? xdr,
    String? xlm,
    String? xrp,
    String? yfi,
    String? zar,
    String? bits,
    String? link,
    String? sats,
  }) {
    return AtlDate(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory AtlDate.fromMap(Map<String, dynamic> map) {
    return AtlDate(
      aed: map['aed'],
      ars: map['ars'],
      aud: map['aud'],
      bch: map['bch'],
      bdt: map['bdt'],
      bhd: map['bhd'],
      bmd: map['bmd'],
      bnb: map['bnb'],
      brl: map['brl'],
      btc: map['btc'],
      cad: map['cad'],
      chf: map['chf'],
      clp: map['clp'],
      cny: map['cny'],
      czk: map['czk'],
      dkk: map['dkk'],
      dot: map['dot'],
      eos: map['eos'],
      eth: map['eth'],
      eur: map['eur'],
      gbp: map['gbp'],
      hkd: map['hkd'],
      huf: map['huf'],
      idr: map['idr'],
      ils: map['ils'],
      inr: map['inr'],
      jpy: map['jpy'],
      krw: map['krw'],
      kwd: map['kwd'],
      lkr: map['lkr'],
      ltc: map['ltc'],
      mmk: map['mmk'],
      mxn: map['mxn'],
      myr: map['myr'],
      ngn: map['ngn'],
      nok: map['nok'],
      nzd: map['nzd'],
      php: map['php'],
      pkr: map['pkr'],
      pln: map['pln'],
      rub: map['rub'],
      sar: map['sar'],
      sek: map['sek'],
      sgd: map['sgd'],
      thb: map['thb'],
      tTry: map['try'],
      twd: map['twd'],
      uah: map['uah'],
      usd: map['usd'],
      vef: map['vef'],
      vnd: map['vnd'],
      xag: map['xag'],
      xau: map['xau'],
      xdr: map['xdr'],
      xlm: map['xlm'],
      xrp: map['xrp'],
      yfi: map['yfi'],
      zar: map['zar'],
      bits: map['bits'],
      link: map['link'],
      sats: map['sats'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AtlDate.fromJson(String source) =>
      AtlDate.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class MarketCap extends Equatable {
  final int aed;
  final int ars;
  final int aud;
  final int bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final int eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final int ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final int xag;
  final int xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final int yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  MarketCap({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  MarketCap copyWith({
    int? aed,
    int? ars,
    int? aud,
    int? bch,
    int? bdt,
    int? bhd,
    int? bmd,
    int? bnb,
    int? brl,
    int? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    int? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    int? kwd,
    int? lkr,
    int? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    int? vef,
    int? vnd,
    int? xag,
    int? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    int? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return MarketCap(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory MarketCap.fromMap(Map<String, dynamic> map) {
    return MarketCap(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toInt(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toInt(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toInt(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toInt(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toInt(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toInt(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toInt(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toInt(),
      xau: map['xau']?.toInt(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toInt(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketCap.fromJson(String source) =>
      MarketCap.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class FullyDilutedValuation extends Equatable {
  final int? aed;
  final int? ars;
  final int? aud;
  final int? bch;
  final int? bdt;
  final int? bhd;
  final int? bmd;
  final int? bnb;
  final int? brl;
  final int? btc;
  final int? cad;
  final int? chf;
  final int? clp;
  final int? cny;
  final int? czk;
  final int? dkk;
  final int? dot;
  final int? eos;
  final int? eth;
  final int? eur;
  final int? gbp;
  final int? hkd;
  final int? huf;
  final int? idr;
  final int? ils;
  final int? inr;
  final int? jpy;
  final int? krw;
  final int? kwd;
  final int? lkr;
  final int? ltc;
  final int? mmk;
  final int? mxn;
  final int? myr;
  final int? ngn;
  final int? nok;
  final int? nzd;
  final int? php;
  final int? pkr;
  final int? pln;
  final int? rub;
  final int? sar;
  final int? sek;
  final int? sgd;
  final int? thb;
  final int? tTry;
  final int? twd;
  final int? uah;
  final int? usd;
  final int? vef;
  final int? vnd;
  final int? xag;
  final int? xau;
  final int? xdr;
  final int? xlm;
  final int? xrp;
  final int? yfi;
  final int? zar;
  final int? bits;
  final int? link;
  final int? sats;
  FullyDilutedValuation({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  FullyDilutedValuation copyWith({
    int? aed,
    int? ars,
    int? aud,
    int? bch,
    int? bdt,
    int? bhd,
    int? bmd,
    int? bnb,
    int? brl,
    int? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    int? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    int? kwd,
    int? lkr,
    int? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    int? vef,
    int? vnd,
    int? xag,
    int? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    int? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return FullyDilutedValuation(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory FullyDilutedValuation.fromMap(Map<String, dynamic> map) {
    return FullyDilutedValuation(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toInt(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toInt(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toInt(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toInt(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toInt(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toInt(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toInt(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toInt(),
      xau: map['xau']?.toInt(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toInt(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FullyDilutedValuation.fromJson(String source) =>
      FullyDilutedValuation.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class TotalVolume extends Equatable {
  final int aed;
  final int ars;
  final int aud;
  final int bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final int eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final int ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final int xag;
  final int xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final int yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  TotalVolume({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  TotalVolume copyWith({
    int? aed,
    int? ars,
    int? aud,
    int? bch,
    int? bdt,
    int? bhd,
    int? bmd,
    int? bnb,
    int? brl,
    int? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    int? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    int? kwd,
    int? lkr,
    int? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    int? vef,
    int? vnd,
    int? xag,
    int? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    int? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return TotalVolume(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory TotalVolume.fromMap(Map<String, dynamic> map) {
    return TotalVolume(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toInt(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toInt(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toInt(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toInt(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toInt(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toInt(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toInt(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toInt(),
      xau: map['xau']?.toInt(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toInt(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalVolume.fromJson(String source) =>
      TotalVolume.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class High24h extends Equatable {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final double bhd;
  final int bmd;
  final double bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  High24h({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  High24h copyWith({
    int? aed,
    int? ars,
    int? aud,
    double? bch,
    int? bdt,
    double? bhd,
    int? bmd,
    double? bnb,
    int? brl,
    int? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    double? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    double? kwd,
    int? lkr,
    double? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    double? vef,
    int? vnd,
    double? xag,
    double? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    double? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return High24h(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory High24h.fromMap(Map<String, dynamic> map) {
    return High24h(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory High24h.fromJson(String source) =>
      High24h.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class Low24h extends Equatable {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final double bhd;
  final int bmd;
  final double bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  Low24h({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  Low24h copyWith({
    int? aed,
    int? ars,
    int? aud,
    double? bch,
    int? bdt,
    double? bhd,
    int? bmd,
    double? bnb,
    int? brl,
    int? btc,
    int? cad,
    int? chf,
    int? clp,
    int? cny,
    int? czk,
    int? dkk,
    int? dot,
    int? eos,
    double? eth,
    int? eur,
    int? gbp,
    int? hkd,
    int? huf,
    int? idr,
    int? ils,
    int? inr,
    int? jpy,
    int? krw,
    double? kwd,
    int? lkr,
    double? ltc,
    int? mmk,
    int? mxn,
    int? myr,
    int? ngn,
    int? nok,
    int? nzd,
    int? php,
    int? pkr,
    int? pln,
    int? rub,
    int? sar,
    int? sek,
    int? sgd,
    int? thb,
    int? tTry,
    int? twd,
    int? uah,
    int? usd,
    double? vef,
    int? vnd,
    double? xag,
    double? xau,
    int? xdr,
    int? xlm,
    int? xrp,
    double? yfi,
    int? zar,
    int? bits,
    int? link,
    int? sats,
  }) {
    return Low24h(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory Low24h.fromMap(Map<String, dynamic> map) {
    return Low24h(
      aed: map['aed']?.toInt(),
      ars: map['ars']?.toInt(),
      aud: map['aud']?.toInt(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toInt(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toInt(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toInt(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toInt(),
      chf: map['chf']?.toInt(),
      clp: map['clp']?.toInt(),
      cny: map['cny']?.toInt(),
      czk: map['czk']?.toInt(),
      dkk: map['dkk']?.toInt(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toInt(),
      gbp: map['gbp']?.toInt(),
      hkd: map['hkd']?.toInt(),
      huf: map['huf']?.toInt(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toInt(),
      inr: map['inr']?.toInt(),
      jpy: map['jpy']?.toInt(),
      krw: map['krw']?.toInt(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toInt(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toInt(),
      mxn: map['mxn']?.toInt(),
      myr: map['myr']?.toInt(),
      ngn: map['ngn']?.toInt(),
      nok: map['nok']?.toInt(),
      nzd: map['nzd']?.toInt(),
      php: map['php']?.toInt(),
      pkr: map['pkr']?.toInt(),
      pln: map['pln']?.toInt(),
      rub: map['rub']?.toInt(),
      sar: map['sar']?.toInt(),
      sek: map['sek']?.toInt(),
      sgd: map['sgd']?.toInt(),
      thb: map['thb']?.toInt(),
      tTry: map['try']?.toInt(),
      twd: map['twd']?.toInt(),
      uah: map['uah']?.toInt(),
      usd: map['usd']?.toInt(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toInt(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toInt(),
      bits: map['bits']?.toInt(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Low24h.fromJson(String source) => Low24h.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class Price_change_24h_in_currency extends Equatable {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final int xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  Price_change_24h_in_currency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  Price_change_24h_in_currency copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    int? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    int? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return Price_change_24h_in_currency(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory Price_change_24h_in_currency.fromMap(Map<String, dynamic> map) {
    return Price_change_24h_in_currency(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Price_change_24h_in_currency.fromJson(String source) =>
      Price_change_24h_in_currency.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class MarketCapChange24hInCurrency extends Equatable {
  final double aed;
  final double ars;
  final double aud;
  final int bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final int bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final int dot;
  final int eos;
  final int eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final int idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final int ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final double xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final double zar;
  final double bits;
  final int link;
  final int sats;
  MarketCapChange24hInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  MarketCapChange24hInCurrency copyWith({
    double? aed,
    double? ars,
    double? aud,
    int? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    int? bnb,
    double? brl,
    int? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    int? dot,
    int? eos,
    int? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    int? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    int? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    int? vnd,
    double? xag,
    double? xau,
    double? xdr,
    int? xlm,
    int? xrp,
    double? yfi,
    double? zar,
    double? bits,
    int? link,
    int? sats,
  }) {
    return MarketCapChange24hInCurrency(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory MarketCapChange24hInCurrency.fromMap(Map<String, dynamic> map) {
    return MarketCapChange24hInCurrency(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toInt(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toInt(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toInt(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toInt(),
      eos: map['eos']?.toInt(),
      eth: map['eth']?.toInt(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toInt(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toInt(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toInt(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toInt(),
      xrp: map['xrp']?.toInt(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toInt(),
      sats: map['sats']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketCapChange24hInCurrency.fromJson(String source) =>
      MarketCapChange24hInCurrency.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class MarketCapChangePercentage24hInCurrency extends Equatable {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  MarketCapChangePercentage24hInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  MarketCapChangePercentage24hInCurrency copyWith({
    double? aed,
    double? ars,
    double? aud,
    double? bch,
    double? bdt,
    double? bhd,
    double? bmd,
    double? bnb,
    double? brl,
    double? btc,
    double? cad,
    double? chf,
    double? clp,
    double? cny,
    double? czk,
    double? dkk,
    double? dot,
    double? eos,
    double? eth,
    double? eur,
    double? gbp,
    double? hkd,
    double? huf,
    double? idr,
    double? ils,
    double? inr,
    double? jpy,
    double? krw,
    double? kwd,
    double? lkr,
    double? ltc,
    double? mmk,
    double? mxn,
    double? myr,
    double? ngn,
    double? nok,
    double? nzd,
    double? php,
    double? pkr,
    double? pln,
    double? rub,
    double? sar,
    double? sek,
    double? sgd,
    double? thb,
    double? tTry,
    double? twd,
    double? uah,
    double? usd,
    double? vef,
    double? vnd,
    double? xag,
    double? xau,
    double? xdr,
    double? xlm,
    double? xrp,
    double? yfi,
    double? zar,
    double? bits,
    double? link,
    double? sats,
  }) {
    return MarketCapChangePercentage24hInCurrency(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory MarketCapChangePercentage24hInCurrency.fromMap(
      Map<String, dynamic> map) {
    return MarketCapChangePercentage24hInCurrency(
      aed: map['aed']?.toDouble(),
      ars: map['ars']?.toDouble(),
      aud: map['aud']?.toDouble(),
      bch: map['bch']?.toDouble(),
      bdt: map['bdt']?.toDouble(),
      bhd: map['bhd']?.toDouble(),
      bmd: map['bmd']?.toDouble(),
      bnb: map['bnb']?.toDouble(),
      brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      cad: map['cad']?.toDouble(),
      chf: map['chf']?.toDouble(),
      clp: map['clp']?.toDouble(),
      cny: map['cny']?.toDouble(),
      czk: map['czk']?.toDouble(),
      dkk: map['dkk']?.toDouble(),
      dot: map['dot']?.toDouble(),
      eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      hkd: map['hkd']?.toDouble(),
      huf: map['huf']?.toDouble(),
      idr: map['idr']?.toDouble(),
      ils: map['ils']?.toDouble(),
      inr: map['inr']?.toDouble(),
      jpy: map['jpy']?.toDouble(),
      krw: map['krw']?.toDouble(),
      kwd: map['kwd']?.toDouble(),
      lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      mmk: map['mmk']?.toDouble(),
      mxn: map['mxn']?.toDouble(),
      myr: map['myr']?.toDouble(),
      ngn: map['ngn']?.toDouble(),
      nok: map['nok']?.toDouble(),
      nzd: map['nzd']?.toDouble(),
      php: map['php']?.toDouble(),
      pkr: map['pkr']?.toDouble(),
      pln: map['pln']?.toDouble(),
      rub: map['rub']?.toDouble(),
      sar: map['sar']?.toDouble(),
      sek: map['sek']?.toDouble(),
      sgd: map['sgd']?.toDouble(),
      thb: map['thb']?.toDouble(),
      tTry: map['try']?.toDouble(),
      twd: map['twd']?.toDouble(),
      uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      vef: map['vef']?.toDouble(),
      vnd: map['vnd']?.toDouble(),
      xag: map['xag']?.toDouble(),
      xau: map['xau']?.toDouble(),
      xdr: map['xdr']?.toDouble(),
      xlm: map['xlm']?.toDouble(),
      xrp: map['xrp']?.toDouble(),
      yfi: map['yfi']?.toDouble(),
      zar: map['zar']?.toDouble(),
      bits: map['bits']?.toDouble(),
      link: map['link']?.toDouble(),
      sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketCapChangePercentage24hInCurrency.fromJson(String source) =>
      MarketCapChangePercentage24hInCurrency.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}

class CommunityData extends Equatable {
  final String? facebook_likes;
  final int twitter_followers;
  final double reddit_average_posts_48h;
  final double reddit_average_comments_48h;
  final int reddit_subscribers;
  final int reddit_accounts_active_48h;
  final double? telegram_channel_user_count;
  CommunityData({
    required this.facebook_likes,
    required this.twitter_followers,
    required this.reddit_average_posts_48h,
    required this.reddit_average_comments_48h,
    required this.reddit_subscribers,
    required this.reddit_accounts_active_48h,
    required this.telegram_channel_user_count,
  });

  CommunityData copyWith({
    String? facebook_likes,
    int? twitter_followers,
    double? reddit_average_posts_48h,
    double? reddit_average_comments_48h,
    int? reddit_subscribers,
    int? reddit_accounts_active_48h,
    double? telegram_channel_user_count,
  }) {
    return CommunityData(
      facebook_likes: facebook_likes ?? this.facebook_likes,
      twitter_followers: twitter_followers ?? this.twitter_followers,
      reddit_average_posts_48h:
          reddit_average_posts_48h ?? this.reddit_average_posts_48h,
      reddit_average_comments_48h:
          reddit_average_comments_48h ?? this.reddit_average_comments_48h,
      reddit_subscribers: reddit_subscribers ?? this.reddit_subscribers,
      reddit_accounts_active_48h:
          reddit_accounts_active_48h ?? this.reddit_accounts_active_48h,
      telegram_channel_user_count:
          telegram_channel_user_count ?? this.telegram_channel_user_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'facebook_likes': facebook_likes,
      'twitter_followers': twitter_followers,
      'reddit_average_posts_48h': reddit_average_posts_48h,
      'reddit_average_comments_48h': reddit_average_comments_48h,
      'reddit_subscribers': reddit_subscribers,
      'reddit_accounts_active_48h': reddit_accounts_active_48h,
      'telegram_channel_user_count': telegram_channel_user_count,
    };
  }

  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      facebook_likes: map['facebook_likes']?.toString(),
      twitter_followers: map['twitter_followers']?.toInt(),
      reddit_average_posts_48h: map['reddit_average_posts_48h']?.toDouble(),
      reddit_average_comments_48h:
          map['reddit_average_comments_48h']?.toDouble(),
      reddit_subscribers: map['reddit_subscribers']?.toInt(),
      reddit_accounts_active_48h: map['reddit_accounts_active_48h']?.toInt(),
      telegram_channel_user_count:
          map['telegram_channel_user_count']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityData.fromJson(String source) =>
      CommunityData.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      facebook_likes,
      twitter_followers,
      reddit_average_posts_48h,
      reddit_average_comments_48h,
      reddit_subscribers,
      reddit_accounts_active_48h,
      telegram_channel_user_count,
    ];
  }
}

class DeveloperData extends Equatable {
  final int forks;
  final int stars;
  final int subscribers;
  final int total_issues;
  final int closed_issues;
  final int pull_requests_merged;
  final int pull_request_contributors;
  final CodeAdditionsDeletions4Weeks code_additions_deletions_4_weeks;
  final int commit_count_4_weeks;
  final List<int> last_4_weeks_commit_activity_series;
  DeveloperData({
    required this.forks,
    required this.stars,
    required this.subscribers,
    required this.total_issues,
    required this.closed_issues,
    required this.pull_requests_merged,
    required this.pull_request_contributors,
    required this.code_additions_deletions_4_weeks,
    required this.commit_count_4_weeks,
    required this.last_4_weeks_commit_activity_series,
  });

  DeveloperData copyWith({
    int? forks,
    int? stars,
    int? subscribers,
    int? total_issues,
    int? closed_issues,
    int? pull_requests_merged,
    int? pull_request_contributors,
    CodeAdditionsDeletions4Weeks? code_additions_deletions_4_weeks,
    int? commit_count_4_weeks,
    List<int>? last_4_weeks_commit_activity_series,
  }) {
    return DeveloperData(
      forks: forks ?? this.forks,
      stars: stars ?? this.stars,
      subscribers: subscribers ?? this.subscribers,
      total_issues: total_issues ?? this.total_issues,
      closed_issues: closed_issues ?? this.closed_issues,
      pull_requests_merged: pull_requests_merged ?? this.pull_requests_merged,
      pull_request_contributors:
          pull_request_contributors ?? this.pull_request_contributors,
      code_additions_deletions_4_weeks: code_additions_deletions_4_weeks ??
          this.code_additions_deletions_4_weeks,
      commit_count_4_weeks: commit_count_4_weeks ?? this.commit_count_4_weeks,
      last_4_weeks_commit_activity_series:
          last_4_weeks_commit_activity_series ??
              this.last_4_weeks_commit_activity_series,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'forks': forks,
      'stars': stars,
      'subscribers': subscribers,
      'total_issues': total_issues,
      'closed_issues': closed_issues,
      'pull_requests_merged': pull_requests_merged,
      'pull_request_contributors': pull_request_contributors,
      'code_additions_deletions_4_weeks':
          code_additions_deletions_4_weeks.toMap(),
      'commit_count_4_weeks': commit_count_4_weeks,
      'last_4_weeks_commit_activity_series':
          last_4_weeks_commit_activity_series,
    };
  }

  factory DeveloperData.fromMap(Map<String, dynamic> map) {
    return DeveloperData(
      forks: map['forks']?.toInt(),
      stars: map['stars']?.toInt(),
      subscribers: map['subscribers']?.toInt(),
      total_issues: map['total_issues']?.toInt(),
      closed_issues: map['closed_issues']?.toInt(),
      pull_requests_merged: map['pull_requests_merged']?.toInt(),
      pull_request_contributors: map['pull_request_contributors']?.toInt(),
      code_additions_deletions_4_weeks: CodeAdditionsDeletions4Weeks.fromMap(
          map['code_additions_deletions_4_weeks']),
      commit_count_4_weeks: map['commit_count_4_weeks']?.toInt(),
      last_4_weeks_commit_activity_series:
          List<int>.from(map['last_4_weeks_commit_activity_series']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeveloperData.fromJson(String source) =>
      DeveloperData.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      forks,
      stars,
      subscribers,
      total_issues,
      closed_issues,
      pull_requests_merged,
      pull_request_contributors,
      code_additions_deletions_4_weeks,
      commit_count_4_weeks,
      last_4_weeks_commit_activity_series,
    ];
  }
}

class CodeAdditionsDeletions4Weeks extends Equatable {
  final int? additions;
  final int? deletions;
  CodeAdditionsDeletions4Weeks({
    required this.additions,
    required this.deletions,
  });

  CodeAdditionsDeletions4Weeks copyWith({
    int? additions,
    int? deletions,
  }) {
    return CodeAdditionsDeletions4Weeks(
      additions: additions ?? this.additions,
      deletions: deletions ?? this.deletions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'additions': additions,
      'deletions': deletions,
    };
  }

  factory CodeAdditionsDeletions4Weeks.fromMap(Map<String, dynamic> map) {
    return CodeAdditionsDeletions4Weeks(
      additions: map['additions']?.toInt(),
      deletions: map['deletions']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeAdditionsDeletions4Weeks.fromJson(String source) =>
      CodeAdditionsDeletions4Weeks.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [additions, deletions];
}

class PublicInterestStats extends Equatable {
  final int? alexa_rank;
  final String? bing_matches;
  PublicInterestStats({
    required this.alexa_rank,
    required this.bing_matches,
  });

  PublicInterestStats copyWith({
    int? alexa_rank,
    String? bing_matches,
  }) {
    return PublicInterestStats(
      alexa_rank: alexa_rank ?? this.alexa_rank,
      bing_matches: bing_matches ?? this.bing_matches,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alexa_rank': alexa_rank,
      'bing_matches': bing_matches,
    };
  }

  factory PublicInterestStats.fromMap(Map<String, dynamic> map) {
    return PublicInterestStats(
      alexa_rank: map['alexa_rank']?.toInt(),
      bing_matches: map['bing_matches']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicInterestStats.fromJson(String source) =>
      PublicInterestStats.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [alexa_rank, bing_matches];
}
