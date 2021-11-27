// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/app_router.dart';
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';

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
            borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
            elevation: Theme.of(context).cardTheme.elevation!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    context.router.push(const AppSettingsCurrencyRoute());
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
                          Text('Default currency'),
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
                  onTap: () {
                    context.router.push(const AppSettingsThemeRoute());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.palette),
                          VerticalDivider(color: Colors.transparent),
                          Text('Theme'),
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
            borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
            elevation: Theme.of(context).cardTheme.elevation!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    context.router.push(const AppSettingsWhaleRoute());
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
