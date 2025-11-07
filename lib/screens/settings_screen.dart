import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr()), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            title: Text('change_language'.tr()),
            subtitle: Text(
              context.locale.languageCode == 'vi'
                  ? 'vietnamese'.tr()
                  : 'english'.tr(),
            ),
            onTap: () {
              if (context.locale.languageCode == 'vi') {
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('vi'));
              }
            },
          ),
        ],
      ),
    );
  }
}
