// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/core/repositories/preferences/api_tokens_preference.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:crypto_app/ui/views/widgets/primary_button.dart';
import 'package:crypto_app/ui/views/widgets/scaffold_with_back.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          elevation: Theme.of(context).cardTheme.elevation!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: tokenController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter API token';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter API token',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          // backgroundColor: Theme.of(context).primaryColor,
                          ),
                      onPressed: () async {
                        await RepositoryProvider.of<ApiTokensPreference>(
                                context)
                            .removeWhalesApiToken();
                        tokenController.clear();
                        BlocProvider.of<
                                    FilterListBloc<WhaleTransaction, String>>(
                                context)
                            .loadElements();
                      },
                      child: Text(
                        'Clear',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'Save',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Saving ${tokenController.text}');
                          await RepositoryProvider.of<ApiTokensPreference>(
                                  context)
                              .saveWhalesApiToken(tokenController.text);
                          BlocProvider.of<
                                      FilterListBloc<WhaleTransaction, String>>(
                                  context)
                              .loadElements();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
