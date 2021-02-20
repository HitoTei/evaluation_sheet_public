import 'dart:developer';

import 'package:evaluation_sheet/home/sheet_list_provider.dart';
import 'package:evaluation_sheet/home/sheet_list_tile.dart';
import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'add_sheet_button.dart';
import 'setting_button.dart';
import 'sort_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    Scaffold.of(context).removeCurrentSnackBar();
    WidgetsBinding.instance.removeObserver(this);
    log('dispose the home page');
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      Scaffold.of(context).removeCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('評価シート'),
        actions: const [
          SortButton(),
          SettingButton(),
        ],
      ),
      body: const HomeBody(),
      floatingActionButton: const AddSheetButton(),
    );
  }
}

class HomeBody extends HookWidget {
  const HomeBody();
  @override
  Widget build(BuildContext context) {
    final state = useProvider(sheetListProvider.state);
    final list = useProvider(sheetListProvider);

    useEffect(
      () {
        SheetDao().fetchAll().then(list.update);
        return Scaffold.of(context).removeCurrentSnackBar;
      },
      const [],
    );
    return ListView.separated(
      itemCount: state.length + 1,
      itemBuilder: (_, index) {
        if (index == state.length)
          return SizedBox(
            height: 64,
          );

        return Dismissible(
          key: ObjectKey(state[index]),
          child: SheetListTile(
            state[index],
            index,
          ),
          onDismissed: (_) {
            // 新しいのを出すときに、前のやつは消しておく
            Scaffold.of(context).removeCurrentSnackBar();

            // まだ本当に消すか分からないので、リストから削除しておくにとどめる
            final tmp = state[index];
            list.removeAt(index);

            Scaffold.of(context)
                .showSnackBar(
                  SnackBar(
                    content: const Text('削除しました'),
                    action: SnackBarAction(
                      label: '元に戻す',
                      onPressed: () => list.insert(tmp, index),
                    ),
                  ),
                )
                .closed
                .then(
              (value) {
                // 元に戻すが押される以外の理由でスナックバーが消えたら本当に消す
                if (value != SnackBarClosedReason.action)
                  SheetDao().remove(tmp);
              },
            );
          },
        );
      },
      separatorBuilder: (_, index) => const Divider(
        height: 0,
      ),
    );
  }
}
