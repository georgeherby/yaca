// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/core/models/filter.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var isMobile = Theme.of(context).platform.isMobile() &&
        MediaQuery.of(context).size.width <= 480;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            'Exchanges',
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
      Divider(
        color: Colors.transparent,
        height: 4,
      ),
      Text('Select currency to filter',
          style: Theme.of(context).textTheme.caption),
      Divider(
        color: Colors.transparent,
        height: 8,
      ),
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
                  color: currencyFilter[index].selected &&
                          Theme.of(context).brightness == Brightness.light
                      ? Colors.white
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
      Divider(color: Colors.transparent, height: 8),
      Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: tickers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () =>
                    tickers[index].tradeUrl != null ? print('tapped') : null,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        width: isMobile ? 32 : 44,
                        filterQuality: FilterQuality.high,
                        imageUrl: tickers[index].market.logoUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(flex: 5),
                    Expanded(
                        flex: isMobile ? 50 : 80,
                        child: Text(
                          tickers[index].market.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    Spacer(flex: 5),
                    Expanded(
                      flex: 30,
                      child: Text(
                          tickers[index].base + '/' + tickers[index].target),
                    ),
                    isMobile ? Container() : Spacer(flex: 5),
                    isMobile
                        ? Container()
                        : Expanded(
                            flex: 30,
                            child: RelevanceIndicator(
                              value: trustScoreToInt(tickers[index]
                                          .trustScore
                                          ?.toUpperCase() ??
                                      '') *
                                  2,
                              amount: 6,
                              barWidth: 2.5,
                              semanticLabel:
                                  "Trust score is ${tickers[index].trustScore?.toUpperCase() ?? 'n/a'}",
                              selectedColor: trustScoreToColor(
                                  context,
                                  tickers[index].trustScore?.toUpperCase() ??
                                      ''),
                              unselectedolor: Theme.of(context).dividerColor,
                            ),
                          ),
                    isMobile ? Container() : Spacer(flex: 5),
                    isMobile
                        ? Container()
                        : Expanded(
                            flex: 40,
                            child: Text(
                              'Vol: ${tickers[index].volume.volumeFormat(context)}',
                              textAlign: TextAlign.right,
                            ),
                          ),
                    Spacer(flex: 5),
                    Expanded(
                      flex: 50,
                      child: Text(
                        tickers[index].last.currencyFormatWithPrefix(
                            tickers[index].target.toUpperCase() + ' ', context),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Spacer(flex: 5),
                    tickers[index].tradeUrl != null
                        ? Icon(
                            CupertinoIcons.chevron_right,
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.6),
                          )
                        : SizedBox(width: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  int trustScoreToInt(String trustScore) {
    switch (trustScore.toUpperCase()) {
      case 'GREEN':
        return 3;
      case 'YELLOW':
        return 2;
      case 'RED':
        return 1;
      default:
        print(trustScore);
        return 0;
    }
  }

  Color trustScoreToColor(context, String trustScore) {
    switch (trustScore.toUpperCase()) {
      case 'GREEN':
        return kPositiveGreen;
      case 'YELLOW':
        return kYellow;
      case 'RED':
        return kNegativeRed;
      default:
        print(trustScore);
        return Theme.of(context).dividerColor;
    }
  }

  Future launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
