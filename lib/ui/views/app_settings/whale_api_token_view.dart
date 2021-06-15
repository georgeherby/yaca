import 'package:crypto_app/ui/views/widgets/scaffold_with_back.dart';
import 'package:flutter/material.dart';

class WhaleApiTokenView extends StatelessWidget {
  WhaleApiTokenView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Enter API Token',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          elevation: Theme.of(context).cardTheme.elevation!,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Enter Whales API token"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Save');
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
