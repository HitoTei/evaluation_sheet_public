import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit_evaluation_widget.dart';
import 'edit_sheet_tag_button.dart';
import 'evaluation_list_provider.dart';
import 'evaluation_sort_button.dart';
import 'evaluation_tile.dart';

class EvaluationListPage extends HookWidget {
  const EvaluationListPage(this.title, this.sheetId);
  final String title;
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(evaluationListProvider);
    useEffect(
      () {
        EvaluationDao().fetchBySheetId(sheetId).then(
              (value) => provider.update(value),
            );
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        actions: [
          EditSheetTagButton(sheetId),
          const EvaluationSortButton(),
        ],
      ),
      floatingActionButton: EvaluationFab(sheetId),
      body: EvaluationListBody(title, sheetId),
    );
  }
}

class EvaluationFab extends HookWidget {
  const EvaluationFab(this.sheetId);
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final state = useProvider(evaluationListProvider.state);
    return FloatingActionButton(
      tooltip: '新しい項目を追加',
      child: const Icon(Icons.add),
      onPressed: () async {
        if (state.length >= EvaluationList.maxLength) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: const Text('要素が多すぎます'),
            ),
          );
        }
        await showDialog(
          context: context,
          builder: (_) => EditEvaluationWidget(sheetId),
        );
      },
    );
  }
}

class EvaluationListBody extends HookWidget {
  const EvaluationListBody(this.title, this.sheetId);
  final String title;
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final state = useProvider(evaluationListProvider.state);
    final evaluationList = useProvider(evaluationListProvider);
    var point = 0;
    state.forEach((element) => point += element.rate);
    SheetDao().updateSumPoint(sheetId, point);

    return ListView.separated(
      itemCount: state.length + 2,
      itemBuilder: (_, index) {
        if (index == state.length + 1) {
          return const SizedBox(
            height: 64,
          );
        }
        if (index == 0) {
          return ListTile(
            title: const Text('合計'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$point 点'),
                Text('${state.length}/${EvaluationList.maxLength}'),
              ],
            ),
          );
        }
        return Dismissible(
          key: ObjectKey(state[index - 1]),
          child: EvaluationListTile(state[index - 1], index - 1, sheetId),
          onDismissed: (_) {
            Scaffold.of(context).removeCurrentSnackBar();
            final tmp = state[index - 1];
            evaluationList.removeAt(index - 1);

            EvaluationDao().remove(tmp);
            Scaffold.of(context)
                .showSnackBar(
                  SnackBar(
                    content: const Text('削除しました'),
                    action: SnackBarAction(
                      label: '元に戻す',
                      onPressed: () => evaluationList.insert(tmp, index - 1),
                    ),
                  ),
                )
                .closed
                .then((value) {
              if (value == SnackBarClosedReason.action)
                EvaluationDao().insert(tmp);
            });
          },
        );
      },
      separatorBuilder: (_, index) => const Divider(height: 0),
    );
  }
}
