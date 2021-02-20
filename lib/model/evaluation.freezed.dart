// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'evaluation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EvaluationTearOff {
  const _$EvaluationTearOff();

// ignore: unused_element
  _Evaluation call(
      {@nullable int uid = null,
      @nullable int sheetId = null,
      String comment = '',
      int rate = 0}) {
    return _Evaluation(
      uid: uid,
      sheetId: sheetId,
      comment: comment,
      rate: rate,
    );
  }
}

// ignore: unused_element
const $Evaluation = _$EvaluationTearOff();

mixin _$Evaluation {
  @nullable
  int get uid;
  @nullable
  int get sheetId;
  String get comment;
  int get rate;

  $EvaluationCopyWith<Evaluation> get copyWith;
}

abstract class $EvaluationCopyWith<$Res> {
  factory $EvaluationCopyWith(
          Evaluation value, $Res Function(Evaluation) then) =
      _$EvaluationCopyWithImpl<$Res>;
  $Res call(
      {@nullable int uid, @nullable int sheetId, String comment, int rate});
}

class _$EvaluationCopyWithImpl<$Res> implements $EvaluationCopyWith<$Res> {
  _$EvaluationCopyWithImpl(this._value, this._then);

  final Evaluation _value;
  // ignore: unused_field
  final $Res Function(Evaluation) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object sheetId = freezed,
    Object comment = freezed,
    Object rate = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as int,
      sheetId: sheetId == freezed ? _value.sheetId : sheetId as int,
      comment: comment == freezed ? _value.comment : comment as String,
      rate: rate == freezed ? _value.rate : rate as int,
    ));
  }
}

abstract class _$EvaluationCopyWith<$Res> implements $EvaluationCopyWith<$Res> {
  factory _$EvaluationCopyWith(
          _Evaluation value, $Res Function(_Evaluation) then) =
      __$EvaluationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable int uid, @nullable int sheetId, String comment, int rate});
}

class __$EvaluationCopyWithImpl<$Res> extends _$EvaluationCopyWithImpl<$Res>
    implements _$EvaluationCopyWith<$Res> {
  __$EvaluationCopyWithImpl(
      _Evaluation _value, $Res Function(_Evaluation) _then)
      : super(_value, (v) => _then(v as _Evaluation));

  @override
  _Evaluation get _value => super._value as _Evaluation;

  @override
  $Res call({
    Object uid = freezed,
    Object sheetId = freezed,
    Object comment = freezed,
    Object rate = freezed,
  }) {
    return _then(_Evaluation(
      uid: uid == freezed ? _value.uid : uid as int,
      sheetId: sheetId == freezed ? _value.sheetId : sheetId as int,
      comment: comment == freezed ? _value.comment : comment as String,
      rate: rate == freezed ? _value.rate : rate as int,
    ));
  }
}

class _$_Evaluation with DiagnosticableTreeMixin implements _Evaluation {
  const _$_Evaluation(
      {@nullable this.uid = null,
      @nullable this.sheetId = null,
      this.comment = '',
      this.rate = 0})
      : assert(comment != null),
        assert(rate != null);

  @JsonKey(defaultValue: null)
  @override
  @nullable
  final int uid;
  @JsonKey(defaultValue: null)
  @override
  @nullable
  final int sheetId;
  @JsonKey(defaultValue: '')
  @override
  final String comment;
  @JsonKey(defaultValue: 0)
  @override
  final int rate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Evaluation(uid: $uid, sheetId: $sheetId, comment: $comment, rate: $rate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Evaluation'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('sheetId', sheetId))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('rate', rate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Evaluation &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.sheetId, sheetId) ||
                const DeepCollectionEquality()
                    .equals(other.sheetId, sheetId)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(sheetId) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(rate);

  @override
  _$EvaluationCopyWith<_Evaluation> get copyWith =>
      __$EvaluationCopyWithImpl<_Evaluation>(this, _$identity);
}

abstract class _Evaluation implements Evaluation {
  const factory _Evaluation(
      {@nullable int uid,
      @nullable int sheetId,
      String comment,
      int rate}) = _$_Evaluation;

  @override
  @nullable
  int get uid;
  @override
  @nullable
  int get sheetId;
  @override
  String get comment;
  @override
  int get rate;
  @override
  _$EvaluationCopyWith<_Evaluation> get copyWith;
}
