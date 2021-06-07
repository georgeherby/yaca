// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';
import 'package:crypto_app/old/widgets/scaffold_with_back.dart';

class ThemeChoiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose theme',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          elevation: Theme.of(context).cardTheme.elevation!,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRow(
                context,
                'System theme',
                CupertinoIcons.paintbrush,
                ThemeMode.system,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              _buildRow(
                context,
                'Light theme',
                CupertinoIcons.sun_max,
                ThemeMode.light,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              _buildRow(
                context,
                'Dark theme',
                CupertinoIcons.moon,
                ThemeMode.dark,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(
      BuildContext context, String title, IconData icon, ThemeMode themeToUse) {
    var bloc = BlocProvider.of<AppSettingsBloc>(context);

    return InkWell(
      onTap: () {
        bloc.add(UpdateThemeOptionEvent(bloc.state.currency, themeToUse));
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Icon(themeToUse.toIcon()),
              VerticalDivider(color: Colors.transparent),
              Text(title),
              Spacer(),
              bloc.state.theme == themeToUse
                  ? Icon(
                      CupertinoIcons.check_mark,
                    )
                  : Container(),
              VerticalDivider(color: Colors.transparent),
              Icon(CupertinoIcons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
