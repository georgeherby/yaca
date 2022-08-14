// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/theme_mode.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class ThemeChoiceView extends StatelessWidget {
  const ThemeChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose theme',
      body: ElevatedCard(
        // externalPadding:
        //     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            _buildRow(
              context,
              'System theme',
              'Apply theme being used device wide',
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
              'Apply theme with light colors',
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
              'Apply theme with dark colors',
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
    final bloc = BlocProvider.of<ApplicationSettingsBloc>(context);

    return ListTile(
      onTap: () {
        bloc.add(UpdateThemeOptionEvent(bloc.state.currency, themeToUse));
        context.router.pop();
      },
      leading: Icon(themeToUse.toIcon() ?? Ionicons.color_palette_outline,
          color: bloc.state.theme == themeToUse
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface),
      title: Text(title),
      selected: bloc.state.theme == themeToUse,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (bloc.state.theme == themeToUse)
            const Icon(Ionicons.checkmark_outline)
          else
            const SizedBox(height: 0),
        ],
      ),
    );
  }
}
