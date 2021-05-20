import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/old/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/old/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';

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
// lists.where((element) => element.)
      tickers.addAll(_flattenedMarkets
          .where((element) => _selectedCurrencies.contains(element.target)));
    } else {
      tickers.addAll(_flattenedMarkets);
    }
    tickers.sort((b, a) => a.volume.compareTo(b.volume));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  shape: StadiumBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor)),
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
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (bool selected) {
                    debugPrint(selected.toString());
                    setState(() {
                      currencyFilter[index].selected = selected;
                      applyFilter();
                    });
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 8,
            ),
          ] +
          List<Widget>.generate(
            tickers.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: tickers[index].market.logoUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 10,
                        child: Text(
                          tickers[index].market.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    Spacer(),
                    Text(tickers[index].base + '/' + tickers[index].target),
                    Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        tickers[index].trustScore?.toUpperCase() ?? '',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Vol: ${tickers[index].volume.volumeFormat()}',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 4,
                      child: Text(
                        tickers[index].last.currencyFormatWithPrefix(
                            tickers[index].target.toUpperCase()),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: Theme.of(context).cardTheme.elevation!,
                      ),
                      onPressed: tickers[index].tradeUrl != null
                          ? () => launchURL(tickers[index].tradeUrl)
                          : null,
                      child: Text('Trade'),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }

  Future launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
