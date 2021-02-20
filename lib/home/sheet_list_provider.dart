import 'package:evaluation_sheet/model/sheet.dart';
import 'package:evaluation_sheet/repository/dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final sheetListProvider = StateNotifierProvider((_) => SheetList());

class SheetList extends StateNotifier<List<Sheet>> {
  SheetList() : super([]);
  void update(List<Sheet> list) => state = list;
  void add(Sheet sheet) {
    state = [sheet, ...state];
  }

  void updateAt(Sheet sheet, int index) {
    state[index] = sheet;
    state = state;
  }

  Future<void> reFetchAt(int index) async {
    state[index] = await SheetDao().fetchByUid(state[index].uid);
    state = state;
  }

  void insert(Sheet element, int index) {
    state.insert(index, element);
    state = state;
  }

  void removeAt(int index) {
    state.removeAt(index);
    state = state;
  }

  void sort(int Function(Sheet a, Sheet b) algorithm) {
    state.sort(algorithm);
    state = state;
  }
}
