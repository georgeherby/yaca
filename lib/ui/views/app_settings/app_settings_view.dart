// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';
import 'package:crypto_app/ui/views/app_settings/currency_choice_view.dart';
import 'package:crypto_app/ui/views/app_settings/theme_choice_view.dart';
import 'package:crypto_app/ui/views/app_settings/whale_api_token_view.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 16),
              Text('GENERAL',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
          SizedBox(height: 6),
          Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            elevation: Theme.of(context).cardTheme.elevation!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CurrencyChoiceView(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.moneyBillAlt),
                          VerticalDivider(color: Colors.transparent),
                          Text('Choose default currency'),
                          Spacer(),
                          Text(BlocProvider.of<AppSettingsBloc>(context)
                              .state
                              .currency
                              .currencyCode
                              .toUpperCase()),
                          VerticalDivider(color: Colors.transparent),
                          Icon(CupertinoIcons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                ),
                InkWell(
                  onTap: () async => await Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ThemeChoiceView(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.palette),
                          VerticalDivider(color: Colors.transparent),
                          Text('Choose theme'),
                          Spacer(),
                          Icon(BlocProvider.of<AppSettingsBloc>(context)
                              .state
                              .theme
                              .toIcon()),
                          VerticalDivider(color: Colors.transparent),
                          Icon(CupertinoIcons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          SizedBox(height: 6),
          Row(
            children: [
              SizedBox(width: 16),
              Text('API TOKENS',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
          SizedBox(height: 6),
          Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            elevation: Theme.of(context).cardTheme.elevation!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => WhaleApiTokenView(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/whale_outline.svg',
                            height: Theme.of(context).iconTheme.size,
                            width: Theme.of(context).iconTheme.size,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          VerticalDivider(color: Colors.transparent),
                          Expanded(child: Text('Whale Transactions')),
                          VerticalDivider(color: Colors.transparent),
                          Icon(CupertinoIcons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
