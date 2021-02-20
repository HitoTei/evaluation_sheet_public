import 'package:evaluation_sheet/model/sheet.dart';
import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sheet_list_provider.dart';

class EditSheetDialog extends HookWidget {
  const EditSheetDialog({this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final list = useProvider(sheetListProvider);
    final state =
        index == null ? null : useProvider(sheetListProvider.state)[index];

    final controller = TextEditingController();
    if (state != null) controller.text = state.title;

    final title = Text(
      '評価シートの' + (state == null ? '追加' : '編集'),
    );
    final content = TextField(
      controller: controller,
      maxLength: 1000,
    );

    final save = () {
      var val = state?.copyWith?.call(title: controller.text) ??
          Sheet(title: controller.text);

      SheetDao().insert(val).then(
        (value) {
          val = val.copyWith.call(uid: value);
          if (state == null) {
            list.add(val);
          } else {
            list.updateAt(val, index);
          }
          Navigator.pop(context);
        },
      );
    };

    // 横長の時にダイアログを使用するとレイアウトが崩れるので、画面の向きで表示を変更する
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape)
          // 横長の時は、全画面表示
          return Scaffold(
            appBar: AppBar(
              title: title,
              actions: [
                IconButton(icon: const Icon(Icons.save), onPressed: save),
              ],
            ),
            body: SingleChildScrollView(child: content),
          );
        else
          // 縦長の時はダイアログを表示
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: const Text('Save'),
                onPressed: save,
              ),
            ],
          );
      },
    );
  }
}
