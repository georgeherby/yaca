import 'package:crypto_app/old/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/old/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';

class ExchangeListWithFilter extends StatefulWidget {
  final List<ExchangeTicker> exchanges;

  const ExchangeListWithFilter({Key? key, required this.exchanges}) : super(key: key);

  @override
  _ExchangeListWithFilterState createState() => _ExchangeListWithFilterState();
}

class _ExchangeListWithFilterState extends State<ExchangeListWithFilter> {
  List<Tickers> lists = [];
  List<Filter> currencyFilter = [];

  @override
  void initState() {
    super.initState();

    lists.addAll(widget.exchanges.map((e) => e.tickers).expand((element) => element).toList());
    currencyFilter.addAll((lists.map((e) => e.target)).toSet().map((e) => Filter(e, false)));

    currencyFilter.sort((a, b) => a.value.compareTo(b.value));
  }

  void applyFilter() {
    lists.clear();
    List<String> _selectedCurrencies =
        currencyFilter.where((element) => element.selected).map((e) => e.value).toList();
    List<Tickers> _flattenedMarkets =
        widget.exchanges.map((e) => e.tickers).expand((element) => element).toList();

    if (_selectedCurrencies.length > 0) {
// lists.where((element) => element.)
      lists.addAll(
          _flattenedMarkets.where((element) => _selectedCurrencies.contains(element.target)));
    } else {
      lists.addAll(_flattenedMarkets);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Row(
              children: [
                Text(
                  "Exchanges",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            Divider(
              color: Colors.transparent,
              height: 4,
            ),
            Text("Select currency to filter", style: Theme.of(context).textTheme.caption),
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
                  shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
                  selected: currencyFilter[index].selected,
                  label: Text(
                    currencyFilter[index].value.toUpperCase(),
                    style: Theme.of(context).chipTheme.labelStyle.copyWith(
                        fontWeight:
                            currencyFilter[index].selected ? FontWeight.bold : FontWeight.normal,
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
            lists.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        lists[index].market.logoUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                    ),
                    SizedBox(
                        width: 120,
                        child: Text(
                          lists[index].market.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    VerticalDivider(
                      color: Colors.transparent,
                    ),
                    Text(lists[index].base + "/" + lists[index].target),
                    Spacer(),
                    Text(lists[index]
                        .last
                        .currencyFormatWithPrefix(lists[index].target.toUpperCase())),
                    VerticalDivider(
                      color: Colors.transparent,
                    ),
                    RaisedButton(
                      onPressed: () => launchURL(lists[index].tradeUrl),
                      child: Text("Trade"),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
