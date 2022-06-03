// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/theme_mode.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';
import 'package:yaca/ui/views/widgets/surface.dart';

class ThemeChoiceView extends StatelessWidget {
  const ThemeChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose theme',
      body: MaterialSurface(
        externalPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            _buildRow(
              context,
              'System theme',
              "Apply theme being used device wide",
              Ionicons.color_palette_outline,
              ThemeMode.system,
            ),
            const Divider(
              thickness: kDividerWeighting,
              height: kDividerWeighting,
            ),
            _buildRow(
              context,
              'Light theme',
              "Apply theme with light colors",
              Ionicons.sunny_outline,
              ThemeMode.light,
            ),
            const Divider(
              thickness: kDividerWeighting,
              height: kDividerWeighting,
            ),
            _buildRow(
              context,
              'Dark theme',
              "Apply theme with dark colors",
              Ionicons.moon_outline,
              ThemeMode.dark,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String title,
    String subTitle,
    IconData icon,
    ThemeMode themeToUse,
  ) {
    var bloc = BlocProvider.of<AppSettingsBloc>(context);

    return ListTile(
      onTap: () {
        bloc.add(UpdateThemeOptionEvent(bloc.state.currency, themeToUse));
        context.router.pop();
      },
      leading: Icon(themeToUse.toIcon() ?? Ionicons.color_palette_outline),
      title: Text(title),
      selected: bloc.state.theme == themeToUse,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bloc.state.theme == themeToUse
              ? const Icon(Ionicons.checkmark_outline)
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}
