// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityDto _$ActivityDtoFromJson(Map<String, dynamic> json) {
  return _ActivityDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityDto {
  String get key => throw _privateConstructorUsedError;
  String get activity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get participants => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityDtoCopyWith<ActivityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityDtoCopyWith<$Res> {
  factory $ActivityDtoCopyWith(
          ActivityDto value, $Res Function(ActivityDto) then) =
      _$ActivityDtoCopyWithImpl<$Res, ActivityDto>;
  @useResult
  $Res call(
      {String key,
      String activity,
      String type,
      int participants,
      double price});
}

/// @nodoc
class _$ActivityDtoCopyWithImpl<$Res, $Val extends ActivityDto>
    implements $ActivityDtoCopyWith<$Res> {
  _$ActivityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? activity = null,
    Object? type = null,
    Object? participants = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityDtoImplCopyWith<$Res>
    implements $ActivityDtoCopyWith<$Res> {
  factory _$$ActivityDtoImplCopyWith(
          _$ActivityDtoImpl value, $Res Function(_$ActivityDtoImpl) then) =
      __$$ActivityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String activity,
      String type,
      int participants,
      double price});
}

/// @nodoc
class __$$ActivityDtoImplCopyWithImpl<$Res>
    extends _$ActivityDtoCopyWithImpl<$Res, _$ActivityDtoImpl>
    implements _$$ActivityDtoImplCopyWith<$Res> {
  __$$ActivityDtoImplCopyWithImpl(
      _$ActivityDtoImpl _value, $Res Function(_$ActivityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? activity = null,
    Object? type = null,
    Object? participants = null,
    Object? price = null,
  }) {
    return _then(_$ActivityDtoImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityDtoImpl implements _ActivityDto {
  _$ActivityDtoImpl(
      {required this.key,
      required this.activity,
      required this.type,
      required this.participants,
      required this.price});

  factory _$ActivityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityDtoImplFromJson(json);

  @override
  final String key;
  @override
  final String activity;
  @override
  final String type;
  @override
  final int participants;
  @override
  final double price;

  @override
  String toString() {
    return 'ActivityDto(key: $key, activity: $activity, type: $type, participants: $participants, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityDtoImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.participants, participants) ||
                other.participants == participants) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, activity, type, participants, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityDtoImplCopyWith<_$ActivityDtoImpl> get copyWith =>
      __$$ActivityDtoImplCopyWithImpl<_$ActivityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityDto implements ActivityDto {
  factory _ActivityDto(
      {required final String key,
      required final String activity,
      required final String type,
      required final int participants,
      required final double price}) = _$ActivityDtoImpl;

  factory _ActivityDto.fromJson(Map<String, dynamic> json) =
      _$ActivityDtoImpl.fromJson;

  @override
  String get key;
  @override
  String get activity;
  @override
  String get type;
  @override
  int get participants;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$ActivityDtoImplCopyWith<_$ActivityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
