import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'evaluation.freezed.dart';

@freezed
abstract class Evaluation with _$Evaluation {
  const factory Evaluation({
    @nullable @Default(null) int uid,
    @nullable @Default(null) int sheetId,
    @Default('') String comment,
    @Default(0) int rate,
  }) = _Evaluation;
}
