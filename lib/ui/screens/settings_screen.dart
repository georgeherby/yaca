import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/old/widgets/back_chevron_button.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kTitleBarMinHeight,
        title: Text(
          'Settings',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        leadingWidth: Theme.of(context).platform == TargetPlatform.macOS
            ? kLeadingButtonWidthMac
            : kLeadingButtonWidth,
        leading: Theme.of(context).platform == TargetPlatform.macOS
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 24,
                    width: 32,
                    alignment: AlignmentDirectional.center,
                    child: BackChevronButton(
                      onTapped: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(CupertinoIcons.chevron_left)),
      ),
      body: Padding(
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
                          debugPrint(
                              (state.theme == ThemeMode.dark).toString());

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
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        toolbarHeight: kTitleBarMinHeight,
                        leadingWidth:
                            Theme.of(context).platform == TargetPlatform.macOS
                                ? kLeadingButtonWidthMac
                                : kLeadingButtonWidth,
                        leading: Theme.of(context).platform ==
                                TargetPlatform.macOS
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 24,
                                    width: 32,
                                    alignment: AlignmentDirectional.center,
                                    child: BackChevronButton(
                                      onTapped: () => Navigator.pop(context),
                                    ),
                                  ),
                                ],
                              )
                            : IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(CupertinoIcons.chevron_left)),
                      ),
                    ),
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
      ),
    );
  }
}
