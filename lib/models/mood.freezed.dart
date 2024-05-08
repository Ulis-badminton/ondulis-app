// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mood _$MoodFromJson(Map<String, dynamic> json) {
  return _Mood.fromJson(json);
}

/// @nodoc
mixin _$Mood {
  String get auth_id => throw _privateConstructorUsedError;
  int get mood =>
      throw _privateConstructorUsedError; // 0: bad, 1: normal, 2: good
  String? get comment => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoodCopyWith<Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCopyWith<$Res> {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) then) =
      _$MoodCopyWithImpl<$Res, Mood>;
  @useResult
  $Res call({String auth_id, int mood, String? comment, int date});
}

/// @nodoc
class _$MoodCopyWithImpl<$Res, $Val extends Mood>
    implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auth_id = null,
    Object? mood = null,
    Object? comment = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      auth_id: null == auth_id
          ? _value.auth_id
          : auth_id // ignore: cast_nullable_to_non_nullable
              as String,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodImplCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$$MoodImplCopyWith(
          _$MoodImpl value, $Res Function(_$MoodImpl) then) =
      __$$MoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String auth_id, int mood, String? comment, int date});
}

/// @nodoc
class __$$MoodImplCopyWithImpl<$Res>
    extends _$MoodCopyWithImpl<$Res, _$MoodImpl>
    implements _$$MoodImplCopyWith<$Res> {
  __$$MoodImplCopyWithImpl(_$MoodImpl _value, $Res Function(_$MoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auth_id = null,
    Object? mood = null,
    Object? comment = freezed,
    Object? date = null,
  }) {
    return _then(_$MoodImpl(
      auth_id: null == auth_id
          ? _value.auth_id
          : auth_id // ignore: cast_nullable_to_non_nullable
              as String,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoodImpl implements _Mood {
  const _$MoodImpl(
      {required this.auth_id,
      required this.mood,
      this.comment,
      required this.date});

  factory _$MoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodImplFromJson(json);

  @override
  final String auth_id;
  @override
  final int mood;
// 0: bad, 1: normal, 2: good
  @override
  final String? comment;
  @override
  final int date;

  @override
  String toString() {
    return 'Mood(auth_id: $auth_id, mood: $mood, comment: $comment, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodImpl &&
            (identical(other.auth_id, auth_id) || other.auth_id == auth_id) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, auth_id, mood, comment, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodImplCopyWith<_$MoodImpl> get copyWith =>
      __$$MoodImplCopyWithImpl<_$MoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodImplToJson(
      this,
    );
  }
}

abstract class _Mood implements Mood {
  const factory _Mood(
      {required final String auth_id,
      required final int mood,
      final String? comment,
      required final int date}) = _$MoodImpl;

  factory _Mood.fromJson(Map<String, dynamic> json) = _$MoodImpl.fromJson;

  @override
  String get auth_id;
  @override
  int get mood;
  @override // 0: bad, 1: normal, 2: good
  String? get comment;
  @override
  int get date;
  @override
  @JsonKey(ignore: true)
  _$$MoodImplCopyWith<_$MoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
