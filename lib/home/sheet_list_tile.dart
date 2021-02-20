import 'package:evaluation_sheet/evaluation/evaluation_list_page.dart';
import 'package:evaluation_sheet/model/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit_sheet_dialog.dart';
import 'sheet_list_provider.dart';

class SheetListTile extends HookWidget {
  SheetListTile(this.sheet, this.index);
  final Sheet sheet;
  final int index;
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(sheetListProvider);
    return Card(
      child: ListTile(
        onTap: () async {
          // タップしたら詳細ページへ移動
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EvaluationListPage(
                sheet.title,
                sheet.uid,
              ),
            ),
          );
          // 詳細ページから返ってきたら、情報を更新する
          provider.reFetchAt(index);
        },
        onLongPress: () => showDialog(
          // 長押ししたら編集ダイアログを表示
          context: context,
          builder: (_) => EditSheetDialog(
            index: index,
          ),
        ),
        title: Text(
          sheet.title,
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // タグを右側に表示
              '${sheet.tag ?? ''}',
            ),
            Text(
              // 合計ポイントを左側に表示
              '${sheet.sumPoint?.toString() ?? 0}点',
            ),
          ],
        ),
      ),
    );
  }
}
