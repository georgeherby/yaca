// 🐦 Flutter imports:

// � Package imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';
import 'package:yaca/core/extensions/theme_mode.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

// � Flutter imports:

class ApplicationSettingsView extends StatelessWidget {
  const ApplicationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Row(
          children: [
            const SizedBox(width: 16),
            Text('GENERAL',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground)),
          ],
        ),
        const SizedBox(height: 6),
        ElevatedCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  await context.router
                      .push(const ApplicationSettingsCurrencyRoute());
                },
                title: const Text('Currency'),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Ionicons.cash_outline,
                        color: Theme.of(context).colorScheme.onSurface),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context
                          .watch<ApplicationSettingsBloc>()
                          .state
                          .currency
                          .currencyString
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const VerticalDivider(color: Colors.transparent),
                    Icon(Ionicons.chevron_forward_outline,
                        color: Theme.of(context).colorScheme.onSurface),
                  ],
                ),
              ),
              const Divider(
                thickness: kDividerWeighting,
                height: kDividerWeighting,
              ),
              ListTile(
                onTap: () {
                  context.router.push(const ApplicationSettingsThemeRoute());
                },
                title: const Text('Theme'),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Ionicons.color_palette_outline,
                        color: Theme.of(context).colorScheme.onSurface),
                  ],
                ),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                        BlocProvider.of<ApplicationSettingsBloc>(context)
                            .state
                            .theme
                            .toIcon(),
                        color: Theme.of(context).colorScheme.onSurface),
                    const VerticalDivider(color: Colors.transparent),
                    Icon(Ionicons.chevron_forward_outline,
                        color: Theme.of(context).colorScheme.onSurface),
                  ],
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground)),
          ],
        ),
        const SizedBox(height: 6),
        ElevatedCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () =>
                    context.router.push(const ApplicationSettingsWhaleRoute()),
                title: const Text('Whale Transactions'),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/whale_outline.svg',
                      height: Theme.of(context).iconTheme.size,
                      width: Theme.of(context).iconTheme.size,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
