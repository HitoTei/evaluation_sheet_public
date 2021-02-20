import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'evaluation_list_provider.dart';

class SortItemsBottomSheet extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(evaluationListProvider.state);
    final list = useProvider(evaluationListProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('点数が高い順に並べる'),
          onTap: () {
            state.sort((a, b) => b.rate - a.rate);
            list.update(state);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('点数が低い順に並べる'),
          onTap: () {
            state.sort((a, b) => a.rate - b.rate);
            list.update(state);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('追加が新しい順に並べる'),
          onTap: () {
            state.sort((a, b) => b.uid - a.uid);
            list.update(state);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('追加が古い順に並べる'),
          onTap: () {
            state.sort((a, b) => a.uid - b.uid);
            list.update(state);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
