import 'package:evaluation_sheet/home/edit_sheet_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddSheetButton extends HookWidget {
  const AddSheetButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: '新しいシートを追加',
      child: const Icon(Icons.add),
      onPressed: () => showDialog(
        context: context,
        builder: (_) => const EditSheetDialog(
          index: null,
        ),
      ),
    );
  }
}
