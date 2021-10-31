// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';
import 'package:crypto_app/ui/views/widgets/scaffold_with_back.dart';

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
                FontAwesomeIcons.palette,
                ThemeMode.system,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              _buildRow(
                context,
                'Light theme',
                FontAwesomeIcons.sun,
                ThemeMode.light,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              _buildRow(
                context,
                'Dark theme',
                FontAwesomeIcons.moon,
                ThemeMode.dark,
              )
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
        context.router.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Icon(themeToUse.toIcon() ?? FontAwesomeIcons.palette),
              VerticalDivider(color: Colors.transparent),
              Text(title),
              Spacer(),
              bloc.state.theme == themeToUse
                  ? Icon(CupertinoIcons.check_mark)
                  : Container(),
              VerticalDivider(color: Colors.transparent),
            ],
          ),
        ),
      ),
    );
  }
}
