// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../domain/news/entities/news_hit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsHit _$NewsHitFromJson(Map<String, dynamic> json) {
  return _NewsHit.fromJson(json);
}

/// @nodoc
mixin _$NewsHit {
  String? get url => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsHitCopyWith<NewsHit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsHitCopyWith<$Res> {
  factory $NewsHitCopyWith(NewsHit value, $Res Function(NewsHit) then) =
      _$NewsHitCopyWithImpl<$Res, NewsHit>;
  @useResult
  $Res call({String? url, int? points, String? title});
}

/// @nodoc
class _$NewsHitCopyWithImpl<$Res, $Val extends NewsHit>
    implements $NewsHitCopyWith<$Res> {
  _$NewsHitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? points = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsHitImplCopyWith<$Res> implements $NewsHitCopyWith<$Res> {
  factory _$$NewsHitImplCopyWith(
          _$NewsHitImpl value, $Res Function(_$NewsHitImpl) then) =
      __$$NewsHitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, int? points, String? title});
}

/// @nodoc
class __$$NewsHitImplCopyWithImpl<$Res>
    extends _$NewsHitCopyWithImpl<$Res, _$NewsHitImpl>
    implements _$$NewsHitImplCopyWith<$Res> {
  __$$NewsHitImplCopyWithImpl(
      _$NewsHitImpl _value, $Res Function(_$NewsHitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? points = freezed,
    Object? title = freezed,
  }) {
    return _then(_$NewsHitImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsHitImpl implements _NewsHit {
  const _$NewsHitImpl({this.url, this.points, this.title});

  factory _$NewsHitImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsHitImplFromJson(json);

  @override
  final String? url;
  @override
  final int? points;
  @override
  final String? title;

  @override
  String toString() {
    return 'NewsHit(url: $url, points: $points, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsHitImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, points, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsHitImplCopyWith<_$NewsHitImpl> get copyWith =>
      __$$NewsHitImplCopyWithImpl<_$NewsHitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsHitImplToJson(
      this,
    );
  }
}

abstract class _NewsHit implements NewsHit {
  const factory _NewsHit(
      {final String? url,
      final int? points,
      final String? title}) = _$NewsHitImpl;

  factory _NewsHit.fromJson(Map<String, dynamic> json) = _$NewsHitImpl.fromJson;

  @override
  String? get url;
  @override
  int? get points;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$NewsHitImplCopyWith<_$NewsHitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
