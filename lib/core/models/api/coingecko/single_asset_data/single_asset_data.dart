// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/single_asset_data/market_data/market_data.dart';

class SingleAssetData extends Equatable {
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
  factory SingleAssetData.fromJson(String source) =>
      SingleAssetData.fromMap(jsonDecode(source));

  factory SingleAssetData.fromMap(Map<String, dynamic> map) {
    return SingleAssetData(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      blockTimeInMinutes: map['block_time_in_minutes']?.toInt(),
      hashingAlgorithm: map['hashing_algorithm'],
      categories: List<String?>.from(map['categories']),
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
  final String id;
  final String symbol;
  final String name;
  final int blockTimeInMinutes;
  final String? hashingAlgorithm;
  final List<String?> categories;
  final List<String?> additionalNotices;
  final Localization localization;
  final Description description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final String? genesisDate;
  final double? sentimentVotesUpPercentage;
  final double? sentimentVotesDownPercentage;
  final int? marketCapRank;
  final int? coingeckoRank;
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
      blockTimeInMinutes: blockTimeInMinutes ?? this.blockTimeInMinutes,
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
      publicInterestStats: publicInterestStats ?? this.publicInterestStats,
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

  String toJson() => json.encode(toMap());

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
  factory Localization.fromJson(String source) =>
      Localization.fromMap(json.decode(source));

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

  String toJson() => json.encode(toMap());

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
  factory Description.fromJson(String source) =>
      Description.fromMap(json.decode(source));

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

  String toJson() => json.encode(toMap());

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
  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

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

  String toJson() => json.encode(toMap());

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
  const ReposUrl({
    required this.github,
    required this.bitbucket,
  });
  factory ReposUrl.fromJson(String source) =>
      ReposUrl.fromMap(json.decode(source));

  factory ReposUrl.fromMap(Map<String, dynamic> map) {
    return ReposUrl(
      github: List<String>.from(map['github']),
      bitbucket: List<String>.from(map['bitbucket']),
    );
  }
  final List<String> github;
  final List<String> bitbucket;

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

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [github, bitbucket];
}

class Image extends Equatable {
  const Image({
    required this.thumb,
    required this.small,
    required this.large,
  });
  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      thumb: map['thumb'],
      small: map['small'],
      large: map['large'],
    );
  }
  final String thumb;
  final String small;
  final String large;

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

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [thumb, small, large];
}

class CommunityData extends Equatable {
  const CommunityData({
    required this.facebookLikes,
    required this.twitterFollowers,
    required this.redditAveragePosts48h,
    required this.redditAverageComments48h,
    required this.redditSubscribers,
    required this.redditAccountsActive48h,
    required this.telegramChannelUserCount,
  });
  factory CommunityData.fromJson(String source) =>
      CommunityData.fromMap(json.decode(source));

  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      facebookLikes: map['facebook_likes']?.toString(),
      twitterFollowers: map['twitter_followers']?.toInt(),
      redditAveragePosts48h: map['reddit_average_posts_48h']?.toDouble(),
      redditAverageComments48h: map['reddit_average_comments_48h']?.toDouble(),
      redditSubscribers: map['reddit_subscribers']?.toInt(),
      redditAccountsActive48h: map['reddit_accounts_active_48h']?.toInt(),
      telegramChannelUserCount: map['telegram_channel_user_count']?.toDouble(),
    );
  }
  final String? facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48h;
  final double redditAverageComments48h;
  final int redditSubscribers;
  final int redditAccountsActive48h;
  final double? telegramChannelUserCount;

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

  String toJson() => json.encode(toMap());

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
  factory DeveloperData.fromJson(String source) =>
      DeveloperData.fromMap(json.decode(source));

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
      codeAdditionsDeletions4Weeks:
          codeAdditionsDeletions4Weeks ?? this.codeAdditionsDeletions4Weeks,
      commitCount4Weeks: commitCount4Weeks ?? this.commitCount4Weeks,
      last4WeeksCommitActivitySeries:
          last4WeeksCommitActivitySeries ?? this.last4WeeksCommitActivitySeries,
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
      'code_additions_deletions_4_weeks': codeAdditionsDeletions4Weeks.toMap(),
      'commit_count_4_weeks': commitCount4Weeks,
      'last_4_weeks_commit_activity_series': last4WeeksCommitActivitySeries,
    };
  }

  String toJson() => json.encode(toMap());

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
  const CodeAdditionsDeletions4Weeks({
    required this.additions,
    required this.deletions,
  });
  factory CodeAdditionsDeletions4Weeks.fromJson(String source) =>
      CodeAdditionsDeletions4Weeks.fromMap(json.decode(source));

  factory CodeAdditionsDeletions4Weeks.fromMap(Map<String, dynamic> map) {
    return CodeAdditionsDeletions4Weeks(
      additions: map['additions']?.toInt(),
      deletions: map['deletions']?.toInt(),
    );
  }
  final int? additions;
  final int? deletions;

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

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [additions, deletions];
}

class PublicInterestStats extends Equatable {
  const PublicInterestStats({
    required this.alexaRank,
    required this.bingMatches,
  });
  factory PublicInterestStats.fromJson(String source) =>
      PublicInterestStats.fromMap(json.decode(source));

  factory PublicInterestStats.fromMap(Map<String, dynamic> map) {
    return PublicInterestStats(
      alexaRank: map['alexa_rank']?.toInt(),
      bingMatches: map['bing_matches']?.toString(),
    );
  }
  final int? alexaRank;
  final String? bingMatches;

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

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [alexaRank, bingMatches];
}
