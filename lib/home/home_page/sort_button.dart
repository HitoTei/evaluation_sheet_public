import 'package:evaluation_sheet/home/sheet_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../sheet_list_provider.dart';

class SortButton extends HookWidget {
  const SortButton();

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(sheetListProvider);
    return IconButton(
      tooltip: 'ソート',
      icon: const Icon(Icons.sort),
      onPressed: () async {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('点数が高い順に並べる'),
                onTap: () {
                  provider.sort((a, b) => b.sumPoint - a.sumPoint);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('点数が低い順に並べる'),
                onTap: () {
                  provider.sort((a, b) => a.sumPoint - b.sumPoint);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('追加が新しい順に並べる'),
                onTap: () {
                  provider.sort((a, b) => b.uid - a.uid);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('追加が古い順に並べる'),
                onTap: () {
                  provider.sort((a, b) => a.uid - b.uid);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('タグで並べる'),
                onTap: () {
                  provider.sort((a, b) => a.tag.compareTo(b.tag));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
