// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/whalealerts/whale_transactions.dart';
import 'package:yaca/core/repositories/preferences/api_tokens_preference.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:yaca/ui/views/widgets/primary_button.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';
import 'package:yaca/ui/views/widgets/secondary_button.dart';
import 'package:yaca/ui/views/widgets/surface.dart';

class WhaleApiTokenView extends StatelessWidget {
  WhaleApiTokenView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController tokenController = TextEditingController();

  Future updateText(BuildContext context) async {
    tokenController.text =
        await RepositoryProvider.of<ApiTokensPreference>(context)
                .getWhalesApiToken() ??
            '';
  }

  @override
  Widget build(BuildContext context) {
    updateText(context);
    return ScaffoldWithBack(
      title: 'Whale Transactions',
      body: MaterialSurface(
        externalPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: tokenController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'API token required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter API token',
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: kMobileButtonButtonSize,
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onTap: () async {
                        FilterListBloc filterListBloc = BlocProvider.of<
                            FilterListBloc<WhaleTransaction, String>>(context);

                        await RepositoryProvider.of<ApiTokensPreference>(
                                context)
                            .removeWhalesApiToken();
                        tokenController.clear();
                        filterListBloc.loadElements();
                      },
                      buttonText: 'Clear',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'Save',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Saving ${tokenController.text}');
                          FilterListBloc bloc = BlocProvider.of<
                                  FilterListBloc<WhaleTransaction, String>>(
                              context);
                          await RepositoryProvider.of<ApiTokensPreference>(
                                  context)
                              .saveWhalesApiToken(tokenController.text);

                          bloc.loadElements();
                          await context.router.pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
