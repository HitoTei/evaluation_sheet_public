// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SheetTearOff {
  const _$SheetTearOff();

// ignore: unused_element
  _Sheet call({int uid, String title = '', String tag = '', int sumPoint = 0}) {
    return _Sheet(
      uid: uid,
      title: title,
      tag: tag,
      sumPoint: sumPoint,
    );
  }
}

// ignore: unused_element
const $Sheet = _$SheetTearOff();

mixin _$Sheet {
  int get uid;
  String get title;
  String get tag;
  int get sumPoint;

  $SheetCopyWith<Sheet> get copyWith;
}

abstract class $SheetCopyWith<$Res> {
  factory $SheetCopyWith(Sheet value, $Res Function(Sheet) then) =
      _$SheetCopyWithImpl<$Res>;
  $Res call({int uid, String title, String tag, int sumPoint});
}

class _$SheetCopyWithImpl<$Res> implements $SheetCopyWith<$Res> {
  _$SheetCopyWithImpl(this._value, this._then);

  final Sheet _value;
  // ignore: unused_field
  final $Res Function(Sheet) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object title = freezed,
    Object tag = freezed,
    Object sumPoint = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as int,
      title: title == freezed ? _value.title : title as String,
      tag: tag == freezed ? _value.tag : tag as String,
      sumPoint: sumPoint == freezed ? _value.sumPoint : sumPoint as int,
    ));
  }
}

abstract class _$SheetCopyWith<$Res> implements $SheetCopyWith<$Res> {
  factory _$SheetCopyWith(_Sheet value, $Res Function(_Sheet) then) =
      __$SheetCopyWithImpl<$Res>;
  @override
  $Res call({int uid, String title, String tag, int sumPoint});
}

class __$SheetCopyWithImpl<$Res> extends _$SheetCopyWithImpl<$Res>
    implements _$SheetCopyWith<$Res> {
  __$SheetCopyWithImpl(_Sheet _value, $Res Function(_Sheet) _then)
      : super(_value, (v) => _then(v as _Sheet));

  @override
  _Sheet get _value => super._value as _Sheet;

  @override
  $Res call({
    Object uid = freezed,
    Object title = freezed,
    Object tag = freezed,
    Object sumPoint = freezed,
  }) {
    return _then(_Sheet(
      uid: uid == freezed ? _value.uid : uid as int,
      title: title == freezed ? _value.title : title as String,
      tag: tag == freezed ? _value.tag : tag as String,
      sumPoint: sumPoint == freezed ? _value.sumPoint : sumPoint as int,
    ));
  }
}

class _$_Sheet with DiagnosticableTreeMixin implements _Sheet {
  const _$_Sheet({this.uid, this.title = '', this.tag = '', this.sumPoint = 0})
      : assert(title != null),
        assert(tag != null),
        assert(sumPoint != null);

  @override
  final int uid;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String tag;
  @JsonKey(defaultValue: 0)
  @override
  final int sumPoint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sheet(uid: $uid, title: $title, tag: $tag, sumPoint: $sumPoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sheet'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('tag', tag))
      ..add(DiagnosticsProperty('sumPoint', sumPoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sheet &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)) &&
            (identical(other.sumPoint, sumPoint) ||
                const DeepCollectionEquality()
                    .equals(other.sumPoint, sumPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(tag) ^
      const DeepCollectionEquality().hash(sumPoint);

  @override
  _$SheetCopyWith<_Sheet> get copyWith =>
      __$SheetCopyWithImpl<_Sheet>(this, _$identity);
}

abstract class _Sheet implements Sheet {
  const factory _Sheet({int uid, String title, String tag, int sumPoint}) =
      _$_Sheet;

  @override
  int get uid;
  @override
  String get title;
  @override
  String get tag;
  @override
  int get sumPoint;
  @override
  _$SheetCopyWith<_Sheet> get copyWith;
}
