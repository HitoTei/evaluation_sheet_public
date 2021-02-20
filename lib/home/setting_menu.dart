import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            Theme.of(context).brightness == Brightness.dark
                ? 'ライトモードに変更'
                : 'ダークモードに変更',
          ),
          onTap: () {
            DynamicTheme.of(context).setBrightness(
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
            );
            Navigator.pop(context);
          },
        ),
        ListTile(
          // ライセンスを表示
          title: const Text('license'),
          onTap: () async {
            Navigator.pop(context);
            showDialog<void>(
              context: context,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return AboutDialog(
                  applicationName: '評価シート',
                  applicationVersion: '1.2.0',
                  applicationIcon: ImageIcon(
                    AssetImage('assets/icon.png'),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
