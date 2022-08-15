// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/ticker.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/filter.dart';
import 'package:yaca/ui/constants/colours.dart';
import 'package:yaca/ui/constants/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/asset_text_icon.dart';

class ExchangeListWithFilter extends StatefulWidget {
  const ExchangeListWithFilter({super.key, required this.exchanges});
  final List<Ticker> exchanges;

  @override
  State<ExchangeListWithFilter> createState() => _ExchangeListWithFilterState();
}

class _ExchangeListWithFilterState extends State<ExchangeListWithFilter> {
  List<Ticker> tickers = [];
  List<Filter> currencyFilter = [];

  @override
  void initState() {
    super.initState();

    tickers.addAll(widget.exchanges);

    currencyFilter.addAll((tickers.map((e) => e.target))
        .toSet()
        .map((e) => Filter(e, isSelected: false)));

    currencyFilter.sort((a, b) => a.value.compareTo(b.value));
  }

  void applyFilter() {
    tickers.clear();
    final selectedCurrencies = currencyFilter
        .where((element) => element.isSelected)
        .map((e) => e.value)
        .toList();

    if (selectedCurrencies.isNotEmpty) {
      tickers.addAll(widget.exchanges
          .where((element) => selectedCurrencies.contains(element.target)));
    } else {
      tickers.addAll(widget.exchanges);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneOnly = Theme.of(context).platform.onlyMobile(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Select currency to filter',
          style: Theme.of(context).textTheme.bodyMedium),
      const Divider(color: Colors.transparent, height: 8),
      Wrap(
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 4,
        runSpacing: 0,
        children: List.generate(
          currencyFilter.length,
          (index) => FilterChip(
            selected: currencyFilter[index].isSelected,
            label: Text(
              currencyFilter[index].value.toUpperCase(),
            ),
            onSelected: (bool selected) {
              setState(() {
                currencyFilter[index].isSelected = selected;
                applyFilter();
              });
            },
          ),
        ),
      ),
      const Divider(color: Colors.transparent, height: 8),
      const Text('Top 100 (max). 24h volume asc'),
      const Divider(color: Colors.transparent, height: 8),
      Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tickers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () => _launchURL(tickers[index].tradeUrl),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius:
                            BorderRadius.circular(kCornerRadiusCircular),
                        child: tickers[index].market.logo != null
                            ? AssetIconWeb(
                                tickers[index].market.logo,
                                iconSize: kIconSize,
                                assetSymbol:
                                    tickers[index].market.name.substring(0, 2),
                              )
                            : const AssetTextIcon(
                                assetSymbol: '?', iconSize: kIconSize)),
                    const Spacer(flex: 5),
                    Expanded(
                        flex: isPhoneOnly ? 50 : 80,
                        child: Text(
                          tickers[index].market.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    const Spacer(flex: 5),
                    Expanded(
                      flex: 30,
                      child: Text(
                          '${tickers[index].base}/${tickers[index].target}'),
                    ),
                    if (isPhoneOnly) Container() else const Spacer(flex: 5),
                    if (isPhoneOnly)
                      Container()
                    else
                      Expanded(
                        flex: 30,
                        child: RelevanceIndicator(
                          value: _trustScoreToInt(
                                  tickers[index].trustScore.toUpperCase()) *
                              2,
                          amount: 6,
                          barWidth: 2.5,
                          semanticLabel:
                              'Trust score is ${tickers[index].trustScore.toUpperCase()}',
                          selectedColor: _trustScoreToColor(
                              context, tickers[index].trustScore.toUpperCase()),
                          unselectedolor: Theme.of(context).dividerColor,
                        ),
                      ),
                    if (isPhoneOnly) Container() else const Spacer(flex: 5),
                    if (isPhoneOnly)
                      Container()
                    else
                      Expanded(
                        flex: 40,
                        child: Text(
                          'Vol: ${tickers[index].volume.volumeFormat(context)}',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    const Spacer(flex: 5),
                    Expanded(
                      flex: 50,
                      child: Text(
                        tickers[index].last.currencyFormatWithPrefix(
                            '${tickers[index].target.toUpperCase()} ', context),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Spacer(flex: 5),
                    Icon(
                      Icons.chevron_left_rounded,
                      color:
                          Theme.of(context).iconTheme.color?.withOpacity(0.6),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  int _trustScoreToInt(String trustScore) {
    switch (trustScore.toUpperCase()) {
      case 'GREEN':
        return 3;
      case 'YELLOW':
        return 2;
      case 'RED':
        return 1;
      default:
        debugPrint(trustScore);
        return 0;
    }
  }

  Color _trustScoreToColor(context, String trustScore) {
    switch (trustScore.toUpperCase()) {
      case 'GREEN':
        return true.toPositiveNegativeColorFromBool(context);
      case 'YELLOW':
        return kYellow;
      case 'RED':
        return false.toPositiveNegativeColorFromBool(context);
      default:
        debugPrint(trustScore);
        return Theme.of(context).dividerColor;
    }
  }

  Future _launchURL(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
