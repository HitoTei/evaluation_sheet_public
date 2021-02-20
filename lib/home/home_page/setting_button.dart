import 'package:evaluation_sheet/home/setting_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingButton extends StatelessWidget {
  const SettingButton();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: '設定',
      icon: Icon(Icons.more_vert),
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => SettingMenu(),
      ),
    );
  }
}
