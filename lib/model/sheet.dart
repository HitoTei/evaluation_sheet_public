import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet.freezed.dart';

@freezed
abstract class Sheet with _$Sheet {
  const factory Sheet({
    int uid,
    @Default('') String title,
    @Default('') String tag,
    @Default(0) int sumPoint,
  }) = _Sheet;
}
