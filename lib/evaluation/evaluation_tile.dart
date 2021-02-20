import 'package:evaluation_sheet/model/evaluation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'edit_evaluation_widget.dart';

class EvaluationListTile extends HookWidget {
  EvaluationListTile(this._evaluation, this.index, this.sheetId);
  final Evaluation _evaluation;
  final int index;
  final int sheetId;
  @override
  Widget build(BuildContext context) {
    final isEllipsis = useState(true);

    return ListTile(
      onTap: () => isEllipsis.value = !isEllipsis.value,
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditEvaluationWidget(sheetId, index: index),
          ),
        );
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              _evaluation.comment,
              overflow: isEllipsis.value
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
            ),
            width: MediaQuery.of(context).size.width - 150,
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                ((_evaluation.rate > 0) ? '+' : '') +
                    _evaluation.rate.toString(),
                style: TextStyle(
                  color: (_evaluation.rate.isNegative)
                      ? Colors.red[300]
                      : Colors.green[300],
                ),
              ),
            ),
            width: 100,
          ),
        ],
      ),
    );
  }
}
