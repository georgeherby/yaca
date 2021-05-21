// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/ui/views/app_settings/currency_choice_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.cloud_moon),
                    VerticalDivider(color: Colors.transparent),
                    Text('Enable dark mode'),
                    Spacer(),
                    BlocBuilder<AppSettingsBloc, AppSettingsState>(
                      builder: (context, state) {
                        debugPrint(state.theme.toString());
                        debugPrint((state.theme == ThemeMode.dark).toString());

                        return CupertinoSwitch(
                            activeColor: Theme.of(context).primaryColor,
                            value: state.theme == ThemeMode.dark,
                            onChanged: (bool value) {
                              var bloc =
                                  BlocProvider.of<AppSettingsBloc>(context);
                              print('New value to set $value');
                              bloc.add(UpdateThemeOptionEvent(state.currency,
                                  value ? ThemeMode.dark : ThemeMode.light));
                            });
                      },
                    ),
                  ],
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
                  builder: (context) => CurrencyChoiceView(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
          ],
        ),
      ),
    );
  }
}
