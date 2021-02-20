import 'package:flutter/material.dart';

import 'sort_items_bottom_sheet.dart';

class EvaluationSortButton extends StatelessWidget {
  const EvaluationSortButton();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'ソート',
      icon: Icon(Icons.sort),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => SortItemsBottomSheet(),
        );
      },
    );
  }
}
