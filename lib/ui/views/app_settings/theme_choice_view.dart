// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/theme_mode.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';

class ThemeChoiceView extends StatelessWidget {
  const ThemeChoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose theme',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
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
              const Divider(
                thickness: kDividerWeighting,
                height: kDividerWeighting,
              ),
              _buildRow(
                context,
                'Light theme',
                FontAwesomeIcons.sun,
                ThemeMode.light,
              ),
              const Divider(
                thickness: kDividerWeighting,
                height: kDividerWeighting,
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
              const VerticalDivider(color: Colors.transparent),
              Text(title),
              const Spacer(),
              bloc.state.theme == themeToUse
                  ? const Icon(CupertinoIcons.check_mark)
                  : Container(),
              const VerticalDivider(color: Colors.transparent),
            ],
          ),
        ),
      ),
    );
  }
}
