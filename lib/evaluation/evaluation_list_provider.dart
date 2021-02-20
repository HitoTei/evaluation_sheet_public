import 'dart:developer';

import 'package:evaluation_sheet/model/evaluation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final evaluationListProvider = StateNotifierProvider((_) => EvaluationList());

class EvaluationList extends StateNotifier<List<Evaluation>> {
  EvaluationList() : super([]);
  static const maxLength = 10000;
  void add(Evaluation evaluation) {
    state = [evaluation, ...state];
  }

  void update(List<Evaluation> list) {
    try {
      state = list;
    } catch (e) {
      log('error: $e');
    }
  }

  void insert(Evaluation element, int index) {
    state.insert(index, element);
    state = state;
  }

  void updateAt(int index, Evaluation evaluation) {
    state[index] = evaluation;
    state = state;
  }

  void removeAt(int index) {
    state.removeAt(index);
    state = state;
  }

  void remove(Evaluation evaluation) {
    state.remove(evaluation);
    state = state;
  }
}
