import 'package:evaluation_sheet/model/evaluation.dart';
import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'evaluation_list_provider.dart';

class EditEvaluationWidget extends HookWidget {
  const EditEvaluationWidget(this.sheetId, {this.index});
  final int index;
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final evaluationList = useProvider(evaluationListProvider);
    final state = useProvider(evaluationListProvider.state);
    final evaluation = index != null ? state[index] : null;
    final commentEditor = TextEditingController();
    final rateEditor = TextEditingController();
    var isPlus = true;

    if (index != null) {
      commentEditor.text = evaluation.comment;
      rateEditor.text = evaluation.rate.abs().toString();
      isPlus = !evaluation.rate.isNegative;
    }
    final title = const Text('編集');
    final save = () {
      var val = evaluation?.copyWith(
            comment: commentEditor.text,
            rate: int.parse(
                  (rateEditor.text.isNotEmpty) ? rateEditor.text : '0',
                ) *
                (isPlus ? 1 : -1),
          ) ??
          Evaluation(
            sheetId: sheetId,
            comment: commentEditor.text,
            rate: int.parse(
                  (rateEditor.text.isNotEmpty) ? rateEditor.text : '0',
                ) *
                (isPlus ? 1 : -1),
          );
      EvaluationDao().insert(val).then(
        (value) {
          val = val.copyWith(uid: value);
          if (index == null) {
            evaluationList.add(val);
          } else {
            evaluationList.updateAt(index, val);
          }
        },
      );

      Navigator.pop(context);
    };
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: commentEditor,
          maxLength: 1000,
          decoration: InputDecoration(
            labelText: '項目名',
            hintText: '例: 味',
          ),
        ),
        ListTile(
          leading: PlusMinusButton(
            (val) => isPlus = val,
            initialValue: isPlus,
          ),
          title: TextField(
            controller: rateEditor,
            keyboardType: TextInputType.number,
            maxLength: 8,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: '点数',
              hintText: '左のボタンで正負を切り替え',
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: save),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          ),
        ),
      ),
    );
  }
}

class PlusMinusButton extends HookWidget {
  PlusMinusButton(this.onChanged, {this.initialValue = true});
  final Function(bool) onChanged;
  final bool initialValue;
  @override
  Widget build(BuildContext context) {
    final isPlus = useState(initialValue);
    return IconButton(
      tooltip: isPlus.value ? '符号を マイナス にする' : '符号を プラス にする',
      icon: Icon(isPlus.value ? Icons.add : Icons.remove),
      onPressed: () {
        isPlus.value = !isPlus.value;
        onChanged(isPlus.value);
      },
    );
  }
}
