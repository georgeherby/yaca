import 'package:crypto_app/old/single_asset/app_bar_bottom_data_block.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:crypto_app/old/widgets/price_delta.dart';
import 'package:flutter/material.dart';

class AppBarBottom extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final double? percentageChange24h;
  final double? priceChange24h;
  final int marketCap;
  final int rank;
  final String symbol;
  final String? currencySymbol;
  final double circulatingSupply;
  final double? currentPrice;
  final double volume24;

  const AppBarBottom(
      {Key? key,
      required this.currencySymbol,
      required this.currentPrice,
      required this.percentageChange24h,
      required this.priceChange24h,
      required this.rank,
      required this.marketCap,
      required this.symbol,
      required this.circulatingSupply,
      required this.volume24,
      this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("AppBarBottom");
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 5),
                        AppBarBottomDataBlock(
                            title: "Current Price",
                            widgetData: Text(
                              currentPrice?.coinCurrencyFormat().toString() ?? "-",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            )),
                        Spacer(flex: 1),
                        AppBarBottomDataBlock(
                            title: "% Change 24h",
                            widgetData: percentageChange24h != null
                                ? PercentageChangeBox(
                                    percentageChange24h!,
                                    textSize: 16,
                                    showBackground: false,
                                  )
                                : null),
                        Spacer(flex: 1),
                        AppBarBottomDataBlock(
                            title: "Price Change 24h",
                            widgetData: priceChange24h != null
                                ? PriceDelta(priceChange24h!, textSize: 16)
                                : null),
                        Spacer(flex: 5),
                      ],
                    ),
                    Divider(color: Colors.transparent),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppBarBottomDataBlock(title: "Rank", widgetData: Text("#$rank")),
                        AppBarBottomDataBlock(
                            title: "Market Cap",
                            widgetData: Text(
                                "${currencySymbol ?? ""}${compactNumberFormat.format(marketCap)}")),
                        AppBarBottomDataBlock(
                            title: "Circulating Supply",
                            widgetData: Text(
                                "${symbol.toUpperCase()} ${compactNumberFormat.format(circulatingSupply)}")),
                        AppBarBottomDataBlock(
                          title: "Volumne 24h",
                          widgetData: volume24 != null
                              ? Text(
                                  "${currencySymbol ?? ""}${compactNumberFormat.format(volume24)}")
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 1.5);
}
