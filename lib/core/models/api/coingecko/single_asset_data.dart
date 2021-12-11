// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class SingleAssetData extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final int blockTimeInMinutes;
  final String? hashingAlgorithm;
  final List<String> categories;
  final List<String?> additionalNotices;
  final Localization localization;
  final Description description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final String? genesisDate;
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
  final CommunityData communityData;
  final DeveloperData developerData;
  final PublicInterestStats publicInterestStats;
  // final List<String?> status_updates;
  final String lastUpdated;
  const SingleAssetData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.blockTimeInMinutes,
    required this.hashingAlgorithm,
    required this.categories,
    required this.additionalNotices,
    required this.localization,
    required this.description,
    required this.links,
    required this.image,
    required this.countryOrigin,
    required this.genesisDate,
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
    required this.communityData,
    required this.developerData,
    required this.publicInterestStats,
    // required this.status_updates,
    required this.lastUpdated,
  });

  SingleAssetData copyWith({
    String? id,
    String? symbol,
    String? name,
    int? blockTimeInMinutes,
    String? hashingAlgorithm,
    List<String>? categories,
    List<String?>? additionalNotices,
    Localization? localization,
    Description? description,
    Links? links,
    Image? image,
    String? countryOrigin,
    String? genesisDate,
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
    CommunityData? communityData,
    DeveloperData? developerData,
    PublicInterestStats? publicInterestStats,
    // List<String>? status_updates,
    String? lastUpdated,
  }) {
    return SingleAssetData(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      blockTimeInMinutes:
          blockTimeInMinutes ?? this.blockTimeInMinutes,
      hashingAlgorithm: hashingAlgorithm ?? this.hashingAlgorithm,
      categories: categories ?? this.categories,
      additionalNotices: additionalNotices ?? this.additionalNotices,
      localization: localization ?? this.localization,
      description: description ?? this.description,
      links: links ?? this.links,
      image: image ?? this.image,
      countryOrigin: countryOrigin ?? this.countryOrigin,
      genesisDate: genesisDate ?? this.genesisDate,
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
      communityData: communityData ?? this.communityData,
      developerData: developerData ?? this.developerData,
      publicInterestStats:
          publicInterestStats ?? this.publicInterestStats,
      // status_updates: status_updates ?? this.status_updates,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'block_time_in_minutes': blockTimeInMinutes,
      'hashing_algorithm': hashingAlgorithm,
      'categories': categories,
      'additional_notices': additionalNotices,
      'localization': localization.toMap(),
      'description': description.toMap(),
      'links': links.toMap(),
      'image': image.toMap(),
      'country_origin': countryOrigin,
      'genesis_date': genesisDate,
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
      'community_data': communityData.toMap(),
      'developer_data': developerData.toMap(),
      'public_interest_stats': publicInterestStats.toMap(),
      // 'status_updates': status_updates,
      'last_updated': lastUpdated,
    };
  }

  factory SingleAssetData.fromMap(Map<String, dynamic> map) {
    return SingleAssetData(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      blockTimeInMinutes: map['block_time_in_minutes']?.toInt(),
      hashingAlgorithm: map['hashing_algorithm'],
      categories: List<String>.from(map['categories']),
      additionalNotices: List<String?>.from(map['additional_notices']),
      localization: Localization.fromMap(map['localization']),
      description: Description.fromMap(map['description']),
      links: Links.fromMap(map['links']),
      image: Image.fromMap(map['image']),
      countryOrigin: map['country_origin'],
      genesisDate: map['genesis_date'],
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
      communityData: CommunityData.fromMap(map['community_data']),
      developerData: DeveloperData.fromMap(map['developer_data']),
      publicInterestStats:
          PublicInterestStats.fromMap(map['public_interest_stats']),
      // status_updates: List<String?>.from(map['status_updates']),
      lastUpdated: map['last_updated'],
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
      blockTimeInMinutes,
      hashingAlgorithm,
      categories,
      additionalNotices,
      localization,
      description,
      links,
      image,
      countryOrigin,
      genesisDate,
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
      communityData,
      developerData,
      publicInterestStats,
      // status_updates,
      lastUpdated,
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
  const Localization({
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
  const Description({
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
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String? twitterScreenName;
  final String? facebookUsername;
  final String? telegramChannelIdentifier;
  final String? subredditUrl;
  final ReposUrl reposUrl;
  const Links({
    required this.homepage,
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.telegramChannelIdentifier,
    required this.subredditUrl,
    required this.reposUrl,
  });

  Links copyWith({
    List<String>? homepage,
    List<String>? blockchainSite,
    List<String>? officialForumUrl,
    List<String>? chatUrl,
    List<String>? announcementUrl,
    String? twitterScreenName,
    String? facebookUsername,
    String? telegramChannelIdentifier,
    String? subredditUrl,
    ReposUrl? reposUrl,
  }) {
    return Links(
      homepage: homepage ?? this.homepage,
      blockchainSite: blockchainSite ?? this.blockchainSite,
      officialForumUrl: officialForumUrl ?? this.officialForumUrl,
      chatUrl: chatUrl ?? this.chatUrl,
      announcementUrl: announcementUrl ?? this.announcementUrl,
      twitterScreenName: twitterScreenName ?? this.twitterScreenName,
      facebookUsername: facebookUsername ?? this.facebookUsername,
      telegramChannelIdentifier:
          telegramChannelIdentifier ?? this.telegramChannelIdentifier,
      subredditUrl: subredditUrl ?? this.subredditUrl,
      reposUrl: reposUrl ?? this.reposUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homepage': homepage,
      'blockchain_site': blockchainSite,
      'official_forum_url': officialForumUrl,
      'chat_url': chatUrl,
      'announcement_url': announcementUrl,
      'twitter_screen_name': twitterScreenName,
      'facebook_username': facebookUsername,
      'telegram_channel_identifier': telegramChannelIdentifier,
      'subreddit_url': subredditUrl,
      'repos_url': reposUrl.toMap(),
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      homepage: List<String>.from(map['homepage']),
      blockchainSite: List<String>.from(map['blockchain_site']),
      officialForumUrl: List<String>.from(map['official_forum_url']),
      chatUrl: List<String>.from(map['chat_url']),
      announcementUrl: List<String>.from(map['announcement_url']),
      twitterScreenName: map['twitter_screen_name'],
      facebookUsername: map['facebook_username'],
      telegramChannelIdentifier: map['telegram_channel_identifier'],
      subredditUrl: map['subreddit_url'],
      reposUrl: ReposUrl.fromMap(map['repos_url']),
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
      blockchainSite,
      officialForumUrl,
      chatUrl,
      announcementUrl,
      twitterScreenName,
      facebookUsername,
      telegramChannelIdentifier,
      subredditUrl,
      reposUrl,
    ];
  }
}

class ReposUrl extends Equatable {
  final List<String> github;
  final List<String> bitbucket;
  const ReposUrl({
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
  const Image({
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
  final ValuePerCurrency currentPrice;
  final ValuePerCurrency? totalValueLocked;
  final double? mcapToTvlRatio;
  final double? fdvToTvlRatio;
  final Roi roi;
  final Ath ath;
  final AthChangePercentage athChangePercentage;
  final AthDate athDate;
  final Atl atl;
  final AtlChangePercentage atlChangePercentage;
  final AtlDate atlDate;
  final MarketCap marketCap;
  final int marketCapRank;
  final FullyDilutedValuation fullyDilutedValuation;
  final TotalVolume totalVolume;
  final High24h high24h;
  final Low24h low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double priceChangePercentage7d;
  final double priceChangePercentage14d;
  final double priceChangePercentage30d;
  final double priceChangePercentage60d;
  final double priceChangePercentage200d;
  final double priceChangePercentage1y;
  final double marketCapChange24h;
  final double marketCapChangePercentage24h;
  final ValuePerCurrency? priceChange24hInCurrency;
  final ValuePerCurrency? priceChangePercentage1hInCurrency;
  final ValuePerCurrency? priceChangePercentage24hInCurrency;
  final ValuePerCurrency? priceChangePercentage7dInCurrency;
  final ValuePerCurrency? priceChangePercentage14dInCurrency;
  final ValuePerCurrency? priceChangePercentage30dInCurrency;
  final ValuePerCurrency? priceChangePercentage60dInCurrency;
  final ValuePerCurrency? priceChangePercentage200dInCurrency;
  final ValuePerCurrency? priceChangePercentage1yInCurrency;
  final MarketCapChange24hInCurrency marketCapChange24hInCurrency;
  final MarketCapChangePercentage24hInCurrency
      marketCapChangePercentage24hInCurrency;
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
    ValuePerCurrency? currentPrice,
    ValuePerCurrency? totalValueLocked,
    double? mcapToTvlRatio,
    double? fdvToTvlRatio,
    Roi? roi,
    Ath? ath,
    AthChangePercentage? athChangePercentage,
    AthDate? athDate,
    Atl? atl,
    AtlChangePercentage? atlChangePercentage,
    AtlDate? atlDate,
    MarketCap? marketCap,
    int? marketCapRank,
    FullyDilutedValuation? fullyDilutedValuation,
    TotalVolume? totalVolume,
    High24h? high24h,
    Low24h? low24h,
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
    ValuePerCurrency? priceChange24hInCurrency,
    ValuePerCurrency? priceChangePercentage1hInCurrency,
    ValuePerCurrency? priceChangePercentage24hInCurrency,
    ValuePerCurrency? priceChangePercentage7dInCurrency,
    ValuePerCurrency? priceChangePercentage14dInCurrency,
    ValuePerCurrency? priceChangePercentage30dInCurrency,
    ValuePerCurrency? priceChangePercentage60dInCurrency,
    ValuePerCurrency? priceChangePercentage200dInCurrency,
    ValuePerCurrency? priceChangePercentage1yInCurrency,
    MarketCapChange24hInCurrency? marketCapChange24hInCurrency,
    MarketCapChangePercentage24hInCurrency?
        marketCapChangePercentage24hInCurrency,
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
      athChangePercentage:
          athChangePercentage ?? this.athChangePercentage,
      athDate: athDate ?? this.athDate,
      atl: atl ?? this.atl,
      atlChangePercentage:
          atlChangePercentage ?? this.atlChangePercentage,
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
      marketCapChange24h:
          marketCapChange24h ?? this.marketCapChange24h,
      marketCapChangePercentage24h: marketCapChangePercentage24h ??
          this.marketCapChangePercentage24h,
      priceChange24hInCurrency:
          priceChange24hInCurrency ?? this.priceChange24hInCurrency,
      priceChangePercentage1hInCurrency:
          priceChangePercentage1hInCurrency ??
              this.priceChangePercentage1hInCurrency,
      priceChangePercentage24hInCurrency:
          priceChangePercentage24hInCurrency ??
              this.priceChangePercentage24hInCurrency,
      priceChangePercentage7dInCurrency:
          priceChangePercentage7dInCurrency ??
              this.priceChangePercentage7dInCurrency,
      priceChangePercentage14dInCurrency:
          priceChangePercentage14dInCurrency ??
              this.priceChangePercentage14dInCurrency,
      priceChangePercentage30dInCurrency:
          priceChangePercentage30dInCurrency ??
              this.priceChangePercentage30dInCurrency,
      priceChangePercentage60dInCurrency:
          priceChangePercentage60dInCurrency ??
              this.priceChangePercentage60dInCurrency,
      priceChangePercentage200dInCurrency:
          priceChangePercentage200dInCurrency ??
              this.priceChangePercentage200dInCurrency,
      priceChangePercentage1yInCurrency: priceChangePercentage1yInCurrency ??
          this.priceChangePercentage1yInCurrency,
      marketCapChange24hInCurrency: marketCapChange24hInCurrency ??
          this.marketCapChange24hInCurrency,
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
          marketCapChange24hInCurrency.toMap(),
      'market_cap_change_percentage_24h_in_currency':
          marketCapChangePercentage24hInCurrency.toMap(),
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'circulating_supply': circulatingSupply,
      'last_updated': lastUpdated,
    };
  }

  factory MarketData.fromMap(Map<String, dynamic> map) {
    return MarketData(
      currentPrice: ValuePerCurrency.fromMap(map['current_price']),
      totalValueLocked: map['total_value_locked'] != null
          ? ValuePerCurrency.fromMap(map['total_value_locked'])
          : null,
      mcapToTvlRatio: map['mcap_to_tvl_ratio'],
      fdvToTvlRatio:
          map['fdv_to_tvl_ratio'] != null && map['fdv_to_tvl_ratio'] == '?'
              ? null
              : map['fdv_to_tvl_ratio'],
      roi: Roi.fromMap(map['roi']),
      ath: Ath.fromMap(map['ath']),
      athChangePercentage:
          AthChangePercentage.fromMap(map['ath_change_percentage']),
      athDate: AthDate.fromMap(map['ath_date']),
      atl: Atl.fromMap(map['atl']),
      atlChangePercentage:
          AtlChangePercentage.fromMap(map['atl_change_percentage']),
      atlDate: AtlDate.fromMap(map['atl_date']),
      marketCap: MarketCap.fromMap(map['market_cap']),
      marketCapRank: map['market_cap_rank']?.toInt(),
      fullyDilutedValuation:
          FullyDilutedValuation.fromMap(map['fully_diluted_valuation']),
      totalVolume: TotalVolume.fromMap(map['total_volume']),
      high24h: High24h.fromMap(map['high_24h']),
      low24h: Low24h.fromMap(map['low_24h']),
      priceChange24h: map['price_change_24h']?.toDouble(),
      priceChangePercentage24h:
          map['price_change_percentage_24h']?.toDouble(),
      priceChangePercentage7d: map['price_change_percentage_7d']?.toDouble(),
      priceChangePercentage14d:
          map['price_change_percentage_14d']?.toDouble(),
      priceChangePercentage30d:
          map['price_change_percentage_30d']?.toDouble(),
      priceChangePercentage60d:
          map['price_change_percentage_60d']?.toDouble(),
      priceChangePercentage200d:
          map['price_change_percentage_200d']?.toDouble(),
      priceChangePercentage1y: map['price_change_percentage_1y']?.toDouble(),
      marketCapChange24h: map['market_cap_change_24h']?.toDouble(),
      marketCapChangePercentage24h:
          map['market_cap_change_percentage_24h']?.toDouble(),
      priceChange24hInCurrency: map['price_change_24h_in_currency'] != null
          ? ValuePerCurrency.fromMap(map['price_change_24h_in_currency'])
          : null,
      priceChangePercentage1hInCurrency:
          map['price_change_percentage_1h_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_1h_in_currency'])
              : null,
      priceChangePercentage24hInCurrency:
          map['price_change_percentage_24h_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_24h_in_currency'])
              : null,
      priceChangePercentage7dInCurrency:
          map['price_change_percentage_7d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_7d_in_currency'])
              : null,
      priceChangePercentage14dInCurrency:
          map['price_change_percentage_14d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_14d_in_currency'])
              : null,
      priceChangePercentage30dInCurrency:
          map['price_change_percentage_30d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_30d_in_currency'])
              : null,
      priceChangePercentage60dInCurrency:
          map['price_change_percentage_60d_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_60d_in_currency'])
              : null,
      priceChangePercentage200dInCurrency: ValuePerCurrency.fromMap(
          map['price_change_percentage_200d_in_currency']),
      priceChangePercentage1yInCurrency:
          map['price_change_percentage_1y_in_currency'] != null
              ? ValuePerCurrency.fromMap(
                  map['price_change_percentage_1y_in_currency'])
              : null,
      marketCapChange24hInCurrency: MarketCapChange24hInCurrency.fromMap(
          map['market_cap_change_24h_in_currency']),
      marketCapChangePercentage24hInCurrency:
          MarketCapChangePercentage24hInCurrency.fromMap(
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
  const ValuePerCurrency({
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

  const Roi({this.times, this.currency, this.percentage});

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
  const Ath({
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
  const AthChangePercentage({
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
  const AthDate({
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
  const Atl({
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
  const AtlChangePercentage({
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
  const AtlDate({
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
  const MarketCap({
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
  const FullyDilutedValuation({
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
  const TotalVolume({
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
  const High24h({
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
  const Low24h({
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

class PriceChange24hInCurrency extends Equatable {
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
  const PriceChange24hInCurrency({
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

  PriceChange24hInCurrency copyWith({
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
    return PriceChange24hInCurrency(
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

  factory PriceChange24hInCurrency.fromMap(Map<String, dynamic> map) {
    return PriceChange24hInCurrency(
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

  factory PriceChange24hInCurrency.fromJson(String source) =>
      PriceChange24hInCurrency.fromMap(json.decode(source));

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
  const MarketCapChange24hInCurrency({
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
  const MarketCapChangePercentage24hInCurrency({
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
  final String? facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48h;
  final double redditAverageComments48h;
  final int redditSubscribers;
  final int redditAccountsActive48h;
  final double? telegramChannelUserCount;
  const CommunityData({
    required this.facebookLikes,
    required this.twitterFollowers,
    required this.redditAveragePosts48h,
    required this.redditAverageComments48h,
    required this.redditSubscribers,
    required this.redditAccountsActive48h,
    required this.telegramChannelUserCount,
  });

  CommunityData copyWith({
    String? facebookLikes,
    int? twitterFollowers,
    double? redditAveragePosts48h,
    double? redditAverageComments48h,
    int? redditSubscribers,
    int? redditAccountsActive48h,
    double? telegramChannelUserCount,
  }) {
    return CommunityData(
      facebookLikes: facebookLikes ?? this.facebookLikes,
      twitterFollowers: twitterFollowers ?? this.twitterFollowers,
      redditAveragePosts48h:
          redditAveragePosts48h ?? this.redditAveragePosts48h,
      redditAverageComments48h:
          redditAverageComments48h ?? this.redditAverageComments48h,
      redditSubscribers: redditSubscribers ?? this.redditSubscribers,
      redditAccountsActive48h:
          redditAccountsActive48h ?? this.redditAccountsActive48h,
      telegramChannelUserCount:
          telegramChannelUserCount ?? this.telegramChannelUserCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'facebook_likes': facebookLikes,
      'twitter_followers': twitterFollowers,
      'reddit_average_posts_48h': redditAveragePosts48h,
      'reddit_average_comments_48h': redditAverageComments48h,
      'reddit_subscribers': redditSubscribers,
      'reddit_accounts_active_48h': redditAccountsActive48h,
      'telegram_channel_user_count': telegramChannelUserCount,
    };
  }

  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      facebookLikes: map['facebook_likes']?.toString(),
      twitterFollowers: map['twitter_followers']?.toInt(),
      redditAveragePosts48h: map['reddit_average_posts_48h']?.toDouble(),
      redditAverageComments48h:
          map['reddit_average_comments_48h']?.toDouble(),
      redditSubscribers: map['reddit_subscribers']?.toInt(),
      redditAccountsActive48h: map['reddit_accounts_active_48h']?.toInt(),
      telegramChannelUserCount:
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
      facebookLikes,
      twitterFollowers,
      redditAveragePosts48h,
      redditAverageComments48h,
      redditSubscribers,
      redditAccountsActive48h,
      telegramChannelUserCount,
    ];
  }
}

class DeveloperData extends Equatable {
  final int forks;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestsMerged;
  final int pullRequestContributors;
  final CodeAdditionsDeletions4Weeks codeAdditionsDeletions4Weeks;
  final int commitCount4Weeks;
  final List<int> last4WeeksCommitActivitySeries;
  const DeveloperData({
    required this.forks,
    required this.stars,
    required this.subscribers,
    required this.totalIssues,
    required this.closedIssues,
    required this.pullRequestsMerged,
    required this.pullRequestContributors,
    required this.codeAdditionsDeletions4Weeks,
    required this.commitCount4Weeks,
    required this.last4WeeksCommitActivitySeries,
  });

  DeveloperData copyWith({
    int? forks,
    int? stars,
    int? subscribers,
    int? totalIssues,
    int? closedIssues,
    int? pullRequestsMerged,
    int? pullRequestContributors,
    CodeAdditionsDeletions4Weeks? codeAdditionsDeletions4Weeks,
    int? commitCount4Weeks,
    List<int>? last4WeeksCommitActivitySeries,
  }) {
    return DeveloperData(
      forks: forks ?? this.forks,
      stars: stars ?? this.stars,
      subscribers: subscribers ?? this.subscribers,
      totalIssues: totalIssues ?? this.totalIssues,
      closedIssues: closedIssues ?? this.closedIssues,
      pullRequestsMerged: pullRequestsMerged ?? this.pullRequestsMerged,
      pullRequestContributors:
          pullRequestContributors ?? this.pullRequestContributors,
      codeAdditionsDeletions4Weeks: codeAdditionsDeletions4Weeks ??
          this.codeAdditionsDeletions4Weeks,
      commitCount4Weeks: commitCount4Weeks ?? this.commitCount4Weeks,
      last4WeeksCommitActivitySeries:
          last4WeeksCommitActivitySeries ??
              this.last4WeeksCommitActivitySeries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'forks': forks,
      'stars': stars,
      'subscribers': subscribers,
      'total_issues': totalIssues,
      'closed_issues': closedIssues,
      'pull_requests_merged': pullRequestsMerged,
      'pull_request_contributors': pullRequestContributors,
      'code_additions_deletions_4_weeks':
          codeAdditionsDeletions4Weeks.toMap(),
      'commit_count_4_weeks': commitCount4Weeks,
      'last_4_weeks_commit_activity_series':
          last4WeeksCommitActivitySeries,
    };
  }

  factory DeveloperData.fromMap(Map<String, dynamic> map) {
    return DeveloperData(
      forks: map['forks']?.toInt(),
      stars: map['stars']?.toInt(),
      subscribers: map['subscribers']?.toInt(),
      totalIssues: map['total_issues']?.toInt(),
      closedIssues: map['closed_issues']?.toInt(),
      pullRequestsMerged: map['pull_requests_merged']?.toInt(),
      pullRequestContributors: map['pull_request_contributors']?.toInt(),
      codeAdditionsDeletions4Weeks: CodeAdditionsDeletions4Weeks.fromMap(
          map['code_additions_deletions_4_weeks']),
      commitCount4Weeks: map['commit_count_4_weeks']?.toInt(),
      last4WeeksCommitActivitySeries:
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
      totalIssues,
      closedIssues,
      pullRequestsMerged,
      pullRequestContributors,
      codeAdditionsDeletions4Weeks,
      commitCount4Weeks,
      last4WeeksCommitActivitySeries,
    ];
  }
}

class CodeAdditionsDeletions4Weeks extends Equatable {
  final int? additions;
  final int? deletions;
  const CodeAdditionsDeletions4Weeks({
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
  final int? alexaRank;
  final String? bingMatches;
  const PublicInterestStats({
    required this.alexaRank,
    required this.bingMatches,
  });

  PublicInterestStats copyWith({
    int? alexaRank,
    String? bingMatches,
  }) {
    return PublicInterestStats(
      alexaRank: alexaRank ?? this.alexaRank,
      bingMatches: bingMatches ?? this.bingMatches,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alexa_rank': alexaRank,
      'bing_matches': bingMatches,
    };
  }

  factory PublicInterestStats.fromMap(Map<String, dynamic> map) {
    return PublicInterestStats(
      alexaRank: map['alexa_rank']?.toInt(),
      bingMatches: map['bing_matches']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicInterestStats.fromJson(String source) =>
      PublicInterestStats.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [alexaRank, bingMatches];
}
