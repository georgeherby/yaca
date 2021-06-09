// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';
import 'package:crypto_app/ui/views/app_settings/currency_choice_view.dart';
import 'package:crypto_app/ui/views/app_settings/theme_choice_view.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.money_dollar),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.paintbrush),
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
    );
  }
}
