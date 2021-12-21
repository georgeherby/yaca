// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/api/coingecko/exchange_ticker.dart';
import 'package:yaca/core/models/filter.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';

class ExchangeListWithFilter extends StatefulWidget {
  final List<ExchangeTicker> exchanges;

  const ExchangeListWithFilter({Key? key, required this.exchanges})
      : super(key: key);

  @override
  _ExchangeListWithFilterState createState() => _ExchangeListWithFilterState();
}

class _ExchangeListWithFilterState extends State<ExchangeListWithFilter> {
  List<Tickers> tickers = [];
  List<Filter> currencyFilter = [];

  @override
  void initState() {
    super.initState();

    tickers.addAll(widget.exchanges
        .map((e) => e.tickers)
        .expand((element) => element)
        .toList());
    currencyFilter.addAll(
        (tickers.map((e) => e.target)).toSet().map((e) => Filter(e, false)));

    tickers.sort((b, a) => a.volume.compareTo(b.volume));
    currencyFilter.sort((a, b) => a.value.compareTo(b.value));
  }

  void applyFilter() {
    tickers.clear();
    var _selectedCurrencies = currencyFilter
        .where((element) => element.selected)
        .map((e) => e.value)
        .toList();
    var _flattenedMarkets = widget.exchanges
        .map((e) => e.tickers)
        .expand((element) => element)
        .toList();

    if (_selectedCurrencies.isNotEmpty) {
      tickers.addAll(_flattenedMarkets
          .where((element) => _selectedCurrencies.contains(element.target)));
    } else {
      tickers.addAll(_flattenedMarkets);
    }
    tickers.sort((b, a) => a.volume.compareTo(b.volume));
  }

  @override
  Widget build(BuildContext context) {
    var _isPhoneOnly = Theme.of(context).platform.onlyMobile(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Select currency to filter',
          style: Theme.of(context).textTheme.bodyText1),
      const Divider(color: Colors.transparent, height: 8),
      Wrap(
        alignment: WrapAlignment.start,
        spacing: 4,
        runSpacing: 4,
        children: List.generate(
          currencyFilter.length,
          (index) => FilterChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            selected: currencyFilter[index].selected,
            checkmarkColor: Theme.of(context).chipTheme.checkmarkColor,
            label: Text(
              currencyFilter[index].value.toUpperCase(),
              style: Theme.of(context).chipTheme.labelStyle.copyWith(
                  fontWeight: currencyFilter[index].selected
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: currencyFilter[index].selected
                      ? Theme.of(context).chipTheme.checkmarkColor
                      : Theme.of(context).chipTheme.labelStyle.color),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedColor: Theme.of(context).chipTheme.selectedColor,
            onSelected: (bool selected) {
              setState(() {
                currencyFilter[index].selected = selected;
                applyFilter();
              });
            },
          ),
        ),
      ),
      const Divider(color: Colors.transparent, height: 8),
      Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tickers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () => tickers[index].tradeUrl != null
                    ? _launchURL(tickers[index].tradeUrl)
                    : null,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(kCornerRadiusCirlcular),
                      child: AssetIconWeb(
                        tickers[index].market.logoUrl,
                        iconSize: kIconSize,
                        assetSymbol: tickers[index].market.name.substring(0, 2),
                      ),
                    ),
                    const Spacer(flex: 5),
                    Expanded(
                        flex: _isPhoneOnly ? 50 : 80,
                        child: Text(
                          tickers[index].market.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    const Spacer(flex: 5),
                    Expanded(
                      flex: 30,
                      child: Text(
                          tickers[index].base + '/' + tickers[index].target),
                    ),
                    _isPhoneOnly ? Container() : const Spacer(flex: 5),
                    _isPhoneOnly
                        ? Container()
                        : Expanded(
                            flex: 30,
                            child: RelevanceIndicator(
                              value: _trustScoreToInt(tickers[index]
                                          .trustScore
                                          ?.toUpperCase() ??
                                      '') *
                                  2,
                              amount: 6,
                              barWidth: 2.5,
                              semanticLabel:
                                  "Trust score is ${tickers[index].trustScore?.toUpperCase() ?? 'n/a'}",
                              selectedColor: _trustScoreToColor(
                                  context,
                                  tickers[index].trustScore?.toUpperCase() ??
                                      ''),
                              unselectedolor: Theme.of(context).dividerColor,
                            ),
                          ),
                    _isPhoneOnly ? Container() : const Spacer(flex: 5),
                    _isPhoneOnly
                        ? Container()
                        : Expanded(
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
                            tickers[index].target.toUpperCase() + ' ', context),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Spacer(flex: 5),
                    tickers[index].tradeUrl != null
                        ? Icon(
                            CupertinoIcons.chevron_right,
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.6),
                          )
                        : const SizedBox(width: 24),
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
