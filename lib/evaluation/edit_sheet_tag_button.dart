import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter/material.dart';

class EditSheetTagButton extends StatelessWidget {
  EditSheetTagButton(this.sheetId);
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return IconButton(
      tooltip: 'タグを編集',
      icon: const Icon(Icons.tag),
      onPressed: () async {
        controller.text = (await SheetDao().fetchByUid(sheetId)).tag;
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  color: Theme.of(context).primaryColor,
                ),
                AppBar(
                  title: const Text('タグ'),
                  actions: [
                    IconButton(
                      tooltip: '保存',
                      icon: const Icon(Icons.save),
                      onPressed: () async {
                        await SheetDao().updateTag(sheetId, controller.text);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'タグ',
                    hintText: '例: 食事',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
