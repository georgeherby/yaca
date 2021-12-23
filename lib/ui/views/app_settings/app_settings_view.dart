// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/theme_mode.dart';
import 'package:yaca/ui/consts/constants.dart';

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
              const SizedBox(width: 16),
              Text('GENERAL',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
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
                          const Icon(Ionicons.cash_outline),
                          const VerticalDivider(color: Colors.transparent),
                          const Text('Default currency'),
                          const Spacer(),
                          Text(BlocProvider.of<AppSettingsBloc>(context)
                              .state
                              .currency
                              .currencyCode
                              .toUpperCase()),
                          const VerticalDivider(color: Colors.transparent),
                          const Icon(Ionicons.chevron_forward_outline),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: kDividerWeighting,
                  height: kDividerWeighting,
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
                          const Icon(Ionicons.color_palette_outline),
                          const VerticalDivider(color: Colors.transparent),
                          const Text('Theme'),
                          const Spacer(),
                          Icon(BlocProvider.of<AppSettingsBloc>(context)
                              .state
                              .theme
                              .toIcon()),
                          const VerticalDivider(color: Colors.transparent),
                          const Icon(Ionicons.chevron_forward_outline),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(width: 16),
              Text('API TOKENS',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
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
                          const VerticalDivider(color: Colors.transparent),
                          const Expanded(child: Text('Whale Transactions')),
                          const VerticalDivider(color: Colors.transparent),
                          const Icon(Ionicons.chevron_forward_outline),
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
